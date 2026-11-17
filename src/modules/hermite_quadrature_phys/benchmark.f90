program bench_hermite_quadrature_phys
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gh_types
    use m_gh_core
    use m_gh_fast
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    type(gh_rule_t) :: r; integer :: st
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 50
        call build_gauss_hermite(8, r, st); sink = sink + gh_moment(r, 2)
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'hermite_quadrature_phys ms=', (t1 - t0) * 20.0_dp, &
        ' sink=', sink
end program bench_hermite_quadrature_phys
