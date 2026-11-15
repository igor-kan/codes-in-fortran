program test_jacobi_prop
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_jcb_types
    use m_jcb_err
    use m_jcb_core
    use m_jcb_conc
    use m_jcb_inv
    implicit none
    integer, parameter :: n = 6
    real(dp) :: a(n, n), evals(n), evecs(n, n), rq(n)
    type(eigen_config_t) :: cfg
    type(eigen_report_t) :: rep
    integer :: i, j

    do j = 1, n
        do i = 1, n
            a(i, j) = 1.0_dp / real(abs(i - j) + 1, dp)
        end do
        a(j, j) = a(j, j) + real(n, dp)
    end do
    call jacobi_eigen_solve(n, a, evals, evecs, cfg, rep)
    if (rep%status /= ERR_OK) stop 1
    if (eigen_residual(n, a, evals, evecs) > 1.0e-9_dp) stop 2
    if (orthogonality_error(n, evecs) > 1.0e-10_dp) stop 3
    call batch_rayleigh_quotients(n, n, a, evecs, rq)
    if (maxval(abs(rq - evals)) > 1.0e-9_dp) stop 4
end program test_jacobi_prop
