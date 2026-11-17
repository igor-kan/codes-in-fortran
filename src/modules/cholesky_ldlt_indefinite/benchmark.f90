program bench_cholesky_ldlt_indefinite
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ldlt_types
    use m_ldlt_core
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    real(dp) :: a(4,4), l(4,4), d(4); integer :: i; type(ldlt_inertia_t) :: r
    a = 0.0_dp; do i=1,4; a(i,i)=10.0_dp; end do
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 50
        call ldlt_factor(4, a, l, d, r); sink = sink + d(1)
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'cholesky_ldlt_indefinite ms=', (t1 - t0) * 20.0_dp, &
        ' sink=', sink
end program bench_cholesky_ldlt_indefinite
