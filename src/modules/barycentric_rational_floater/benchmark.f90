program bench_barycentric_rational_floater
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_fh_types
    use m_fh_core
    use m_fh_fast
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 100
        sink = sink + fh_eval_d1([0.0_dp, 1.0_dp, 2.0_dp], [1.0_dp, 2.0_dp, 3.0_dp], 0.5_dp)
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'barycentric_rational_floater ms=', (t1 - t0) * 1000.0_dp, ' sink=', sink
end program bench_barycentric_rational_floater
