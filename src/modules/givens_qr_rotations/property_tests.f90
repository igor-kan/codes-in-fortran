program test_gqr_prop
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gqr_types
    use m_gqr_err
    use m_gqr_core
    use m_gqr_conc
    use m_gqr_inv
    implicit none
    integer, parameter :: m = 8, n = 5
    real(dp) :: a(m, n), q(m, m), r(m, n), proj(m, n)
    type(qr_status_t) :: st
    integer :: i, j

    do j = 1, n
        do i = 1, m
            a(i, j) = (real(i, dp) / real(m, dp)) ** (j - 1)
        end do
    end do
    call givens_qr_factor(m, n, a, q, r, st)
    if (st%status /= ERR_OK) stop 1
    if (qr_recon_error(m, n, a, q, r) > 1.0e-10_dp) stop 2
    if (q_ortho_error(m, q) > 1.0e-10_dp) stop 3
    call batch_project_q(m, n, q, a, proj)
    if (sqrt(sum((proj - r) ** 2)) > 1.0e-10_dp) stop 4
end program test_gqr_prop
