program bench_sylvester_bartels_2x2_f08
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_syl_types
    use m_syl_core
    use m_syl_fast
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 100
        sink = sink + fast_l2_sq([2.0_dp, 3.0_dp])
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'sylvester_bartels_2x2_f08 ms=', (t1 - t0) * 1000.0_dp, ' sink=', sink
end program bench_sylvester_bartels_2x2_f08
