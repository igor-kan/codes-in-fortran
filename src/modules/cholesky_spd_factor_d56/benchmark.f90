program bench_cholesky_spd_factor_d56
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_chol_types
    use m_chol_core
    use m_chol_fast
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 100
        block
            real(dp) :: ba(2, 2), bl(2, 2)
            ba = reshape([4.0_dp, 2.0_dp, 2.0_dp, 5.0_dp], [2, 2])
            call cholesky_factor(ba, bl, 2)
            sink = sink + bl(2, 2)
        end block
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'cholesky_spd_factor_d56 ms=', (t1 - t0) * 1000.0_dp, ' sink=', sink
end program bench_cholesky_spd_factor_d56
