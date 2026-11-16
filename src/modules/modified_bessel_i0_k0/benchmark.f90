program bench_modified_bessel_i0_k0
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_bes_core
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    integer :: j
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 50
        do j = 1, 200
            sink = sink + bessel_k0(0.05_dp * real(j, dp))
        end do
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'modified_bessel_i0_k0 ms=', (t1 - t0) * 20.0_dp, ' sink=', sink
end program bench_modified_bessel_i0_k0
