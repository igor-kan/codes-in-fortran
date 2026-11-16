program bench_conjugate_gradient_f08
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_cgf_types
    use m_cgf_core
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    real(dp) :: a(16, 16), b(16), x(16)
    type(cg_config_t) :: cfg
    type(cg_report_t) :: rep
    integer :: i
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 50
        a = 0.0_dp
        do i = 1, 16
            a(i, i) = 4.0_dp; b(i) = real(i, dp); x(i) = 0.0_dp
            if (i > 1) a(i, i-1) = -1.0_dp
            if (i < 16) a(i, i+1) = -1.0_dp
        end do
        call pcg_dense_solve(16, a, b, x, cfg, rep)
        sink = sink + sum(abs(x))
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'conjugate_gradient_f08 ms=', (t1 - t0) * 20.0_dp, ' sink=', sink
end program bench_conjugate_gradient_f08
