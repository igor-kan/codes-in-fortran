program bench_simpson_2d_tensor_quad
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_s2d_types
    use m_s2d_fast
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    type(box2d_t) :: b
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 50
        b = box2d_t(0.0_dp, 1.0_dp, 0.0_dp, 1.0_dp, 8, 8); sink = sink + weight_1d(mod(it, 8), b%nx)
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'simpson_2d_tensor_quad ms=', (t1 - t0) * 20.0_dp, &
        ' sink=', sink
end program bench_simpson_2d_tensor_quad
