program bench_gauss_hermite_3pt_5pt
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gh5_types
    use m_gh5_core
    use m_gh5_fast
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 100
        sink = sink + gauss_hermite_5pt_even_pow(2)
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'gauss_hermite_3pt_5pt ms=', (t1 - t0) * 1000.0_dp, ' sink=', sink
end program bench_gauss_hermite_3pt_5pt
