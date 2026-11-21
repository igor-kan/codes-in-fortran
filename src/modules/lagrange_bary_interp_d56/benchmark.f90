program bench_lagrange_bary_interp_d56
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
        block
            real(dp) :: bxs(3), bys(3)
            bxs = [0.0_dp, 1.0_dp, 3.0_dp]; bys = [1.0_dp, 2.0_dp, 10.0_dp]
            sink = sink + bary_eval(bxs, bys, 3, 2.0_dp)
        end block
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'lagrange_bary_interp_d56 ms=', (t1 - t0) * 1000.0_dp, ' sink=', sink
end program bench_lagrange_bary_interp_d56
