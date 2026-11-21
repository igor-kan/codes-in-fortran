program bench_householder_qr_vec_d56
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_hhqr_types
    use m_hhqr_core
    use m_hhqr_fast
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 100
        block
            real(dp) :: bx(3), by(3)
            bx = [1.0_dp, 2.0_dp, 2.0_dp]
            call householder_reflect(bx, by, 3)
            sink = sink + abs(by(1))
        end block
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'householder_qr_vec_d56 ms=', (t1 - t0) * 1000.0_dp, ' sink=', sink
end program bench_householder_qr_vec_d56
