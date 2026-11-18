program bench_inverse_iteration_rayleigh
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_rqi_types
    use m_rqi_core
    use m_rqi_fast
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 100
        sink = sink + fast_l2_sq([3.0_dp, 5.0_dp])
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'inverse_iteration_rayleigh ms=', (t1 - t0) * 1000.0_dp, ' sink=', sink
end program bench_inverse_iteration_rayleigh
