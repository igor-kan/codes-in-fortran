program bench_power_eigen_dominant_d56
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_poweig_types
    use m_poweig_core
    use m_poweig_fast
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 100
        block
            real(dp) :: ba(2, 2)
            ba = reshape([2.0_dp, 1.0_dp, 1.0_dp, 2.0_dp], [2, 2])
            sink = sink + dominant_eigval(ba, 2, 25)
        end block
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'power_eigen_dominant_d56 ms=', (t1 - t0) * 1000.0_dp, ' sink=', sink
end program bench_power_eigen_dominant_d56
