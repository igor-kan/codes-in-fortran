program bench_tridiagonal_thomas_f90_d56
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_tdma_types
    use m_tdma_core
    use m_tdma_fast
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 100
        block
            real(dp) :: ba(3), bb(3), bc(3), bd(3), bx(3)
            ba = [0.0_dp, -1.0_dp, -1.0_dp]; bb = [4.0_dp, 4.0_dp, 4.0_dp]
            bc = [-1.0_dp, -1.0_dp, 0.0_dp]; bd = [3.0_dp, 2.0_dp, 3.0_dp]
            call solve_tridiag(ba, bb, bc, bd, bx, 3)
            sink = sink + bx(1)
        end block
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'tridiagonal_thomas_f90_d56 ms=', (t1 - t0) * 1000.0_dp, ' sink=', sink
end program bench_tridiagonal_thomas_f90_d56
