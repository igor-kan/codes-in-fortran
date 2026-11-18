program bench_richardson_derivative_extrap
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_rde_types
    use m_rde_core
    use m_rde_fast
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 100
        sink = sink + richardson_diff_sin(0.5_dp, 0.1_dp)
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'richardson_derivative_extrap ms=', (t1 - t0) * 1000.0_dp, ' sink=', sink
end program bench_richardson_derivative_extrap
