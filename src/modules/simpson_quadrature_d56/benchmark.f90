program bench_simpson_quadrature_d56
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_simp_types
    use m_simp_core
    use m_simp_fast
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 100
        sink = sink + simpson_cubics(0.0_dp, 2.0_dp, 20)
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'simpson_quadrature_d56 ms=', (t1 - t0) * 1000.0_dp, ' sink=', sink
end program bench_simpson_quadrature_d56
