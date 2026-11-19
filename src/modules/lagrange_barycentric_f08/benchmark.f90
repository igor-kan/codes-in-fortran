program bench_lagrange_barycentric_f08
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_bary_types
    use m_bary_core
    use m_bary_fast
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 100
        sink = sink + eval_bary_4pt([0.0_dp,1.0_dp,2.0_dp,3.0_dp], [0.0_dp,1.0_dp,4.0_dp,9.0_dp], 1.5_dp)
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'lagrange_barycentric_f08 ms=', (t1 - t0) * 1000.0_dp, ' sink=', sink
end program bench_lagrange_barycentric_f08
