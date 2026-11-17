program bench_ode_adams_bashforth_4
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ab4_fast
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    real(dp) :: y = 1.0_dp
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 50
        y = ab4_predictor(1.0_dp, 0.01_dp, y, y, y, y); sink = sink + y
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'ode_adams_bashforth_4 ms=', (t1 - t0) * 20.0_dp, &
        ' sink=', sink
end program bench_ode_adams_bashforth_4
