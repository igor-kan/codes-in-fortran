program test_gqr_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gqr_types
    use m_gqr_err
    use m_gqr_core
    use m_gqr_val
    use m_gqr_fast
    use m_gqr_inv
    implicit none
    integer, parameter :: m = 4, n = 2
    real(dp) :: a(m, n), q(m, m), r(m, n), rhs(m), x(n)
    type(qr_status_t) :: st

    a = reshape([1.0_dp, 1.0_dp, 1.0_dp, 1.0_dp, &
                 0.0_dp, 1.0_dp, 2.0_dp, 3.0_dp], [m, n])
    rhs = [1.0_dp, 3.0_dp, 5.0_dp, 7.0_dp]
    if (validate_qr_shape(m, n, a) /= ERR_OK) stop 1
    call givens_qr_factor(m, n, a, q, r, st)
    if (st%status /= ERR_OK) stop 2
    if (qr_recon_error(m, n, a, q, r) > 1.0e-11_dp) stop 3
    if (q_ortho_error(m, q) > 1.0e-11_dp) stop 4
    call qr_least_squares(m, n, q, r, rhs, x)
    if (abs(x(1) - 1.0_dp) > 1.0e-10_dp .or. abs(x(2) - 2.0_dp) > 1.0e-10_dp) stop 5
end program test_gqr_unit
