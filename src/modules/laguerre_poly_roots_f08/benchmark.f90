program bench_laguerre_poly_roots_f08
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_lag_types
    use m_lag_core
    use m_lag_fast
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    type(gl_rule_t) :: rule; integer :: st
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 50
        call build_gauss_laguerre(8, rule, st); sink = sink + integrate_lag_poly(rule, 2)
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'laguerre_poly_roots_f08 ms=', (t1 - t0) * 20.0_dp, &
        ' sink=', sink
end program bench_laguerre_poly_roots_f08
