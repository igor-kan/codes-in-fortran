program bench_rk4_ode_integrator_d56
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_rk4_types
    use m_rk4_core
    use m_rk4_fast
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 100
        sink = sink + rk4_exp_integrate(1.0_dp, -1.0_dp, 0.05_dp, 20)
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'rk4_ode_integrator_d56 ms=', (t1 - t0) * 1000.0_dp, ' sink=', sink
end program bench_rk4_ode_integrator_d56
