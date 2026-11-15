program bench_sor
    use, intrinsic :: iso_fortran_env, only: dp => real64, int64
    use m_sor_types
    use m_sor_core
    use m_sor_fast
    implicit none
    integer, parameter :: n = 33
    real(dp) :: h, u(n, n), rhs(n, n)
    type(sor_config_t) :: cfg
    type(sor_report_t) :: rep
    integer(int64) :: t0, t1, rate

    h = 1.0_dp / real(n - 1, dp)
    cfg%omega = optimal_sor_omega(n)
    cfg%max_iter = 400
    u = 0.0_dp
    rhs = 1.0_dp
    call system_clock(t0, rate)
    call solve_poisson_redblack(n, n, h, rhs, cfg, u, rep)
    call system_clock(t1)
    if (rep%max_residual < 0.0_dp .or. t1 < t0 .or. rate <= 0) stop 1
end program bench_sor
