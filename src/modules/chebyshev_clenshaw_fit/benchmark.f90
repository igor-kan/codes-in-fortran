program bench_chebyshev_clenshaw_fit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ch_types
    use m_ch_core
    use m_ch_fast
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    real(dp) :: xs(0:10), ys(0:10); integer :: st; type(cheb_series_t) :: s
    call cheb_nodes(10, xs); ys=sin(xs); call fit_chebyshev_nodes(10, ys, s, st)
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 50
        sink = sink + eval_clenshaw(s, 0.01_dp * real(it, dp))
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'chebyshev_clenshaw_fit ms=', (t1 - t0) * 20.0_dp, &
        ' sink=', sink
end program bench_chebyshev_clenshaw_fit
