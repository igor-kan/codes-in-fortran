program test_gmr_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gmr_types
    use m_gmr_err
    use m_gmr_core
    use m_gmr_val
    use m_gmr_inv
    implicit none
    integer, parameter :: n = 4
    real(dp) :: a(n, n), b(n), x(n)
    type(gmres_config_t) :: cfg
    type(gmres_report_t) :: rep

    a = reshape([4.0_dp, 0.5_dp, 0.0_dp, 0.0_dp, &
                -1.0_dp, 5.0_dp, 0.3_dp, 0.0_dp, &
                 0.2_dp,-0.4_dp, 6.0_dp, 0.1_dp, &
                 0.0_dp, 0.1_dp,-0.2_dp, 3.0_dp], [n, n])
    b = [1.0_dp, 2.0_dp, -1.0_dp, 4.0_dp]
    x = 0.0_dp
    if (validate_gmres_inputs(n, a, b, cfg) /= ERR_OK) stop 1
    call gmres_solve(n, a, b, cfg, x, rep)
    if (rep%status /= ERR_OK) stop 2
    if (true_residual_norm(n, a, b, x) > 1.0e-10_dp) stop 3
end program test_gmr_unit
