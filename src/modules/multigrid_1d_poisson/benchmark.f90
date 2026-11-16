program bench_multigrid_1d_poisson
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_mg_core
    use m_mg_conc
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    real(dp) :: u(0:64), f(0:64), h
    real(dp), parameter :: pi = acos(-1.0_dp)
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 50
        h = 1.0_dp / 64.0_dp
        u = 0.0_dp
        call compute_manufactured_rhs(64, h, pi, f)
        call vcycle_1d(64, h, u, f)
        sink = sink + u(32)
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'multigrid_1d_poisson ms=', (t1 - t0) * 20.0_dp, ' sink=', sink
end program bench_multigrid_1d_poisson
