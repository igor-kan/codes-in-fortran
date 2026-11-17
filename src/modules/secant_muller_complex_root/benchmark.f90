module m_sec_bench_fn
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function b_cos(x) result(y)
        real(dp), intent(in) :: x
        real(dp) :: y
        y = cos(x)
    end function b_cos
end module m_sec_bench_fn
program bench_secant_muller_complex_root
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_sec_fast
    use m_sec_bench_fn
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink, x
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 50
        x = steffensen_step(b_cos, 0.7_dp)
        sink = sink + x
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'secant_muller_complex_root ms=', &
        (t1 - t0) * 20.0_dp, ' sink=', sink
end program bench_secant_muller_complex_root
