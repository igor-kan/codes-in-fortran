program bench_gauss_legendre_n3_quad
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gl3_types
    use m_gl3_core
    use m_gl3_fast
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 100
        sink = sink + gl3_integrate_poly5(0.0_dp, 1.0_dp)
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'gauss_legendre_n3_quad ms=', (t1 - t0) * 1000.0_dp, ' sink=', sink
end program bench_gauss_legendre_n3_quad
