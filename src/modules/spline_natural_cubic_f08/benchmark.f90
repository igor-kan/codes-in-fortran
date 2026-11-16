program bench_spline_natural_cubic_f08
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_spl_core
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    real(dp) :: x(32), y(32), b(32), c(32), d(32)
    integer :: i, code
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 50
        do i = 1, 32
            x(i) = real(i, dp); y(i) = sin(x(i))
        end do
        call fit_natural_spline(32, x, y, b, c, d, code)
        sink = sink + eval_natural_spline(32, x, y, b, c, d, 15.5_dp)
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'spline_natural_cubic_f08 ms=', (t1 - t0) * 20.0_dp, ' sink=', sink
end program bench_spline_natural_cubic_f08
