program bench_power_iteration_deflated
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_pwr_types
    use m_pwr_core
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    real(dp) :: a(8, 8), evals(3), evecs(8, 3)
    type(power_opts_t) :: opts
    integer :: i, code
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 50
        a = 0.0_dp
        do i = 1, 8
            a(i, i) = real(10 - i, dp)
        end do
        call top_k_eigenpairs_deflated(8, 3, a, opts, evals, evecs, code)
        sink = sink + evals(1)
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'power_iteration_deflated ms=', (t1 - t0) * 20.0_dp, ' sink=', sink
end program bench_power_iteration_deflated
