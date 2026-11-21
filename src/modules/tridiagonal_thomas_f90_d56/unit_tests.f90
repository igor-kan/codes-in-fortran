program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_tdma_types
    use m_tdma_core
    use m_tdma_inv
    use m_tdma_val
    implicit none
block
        real(dp) :: a(3), b(3), c(3), d(3), x(3)
        a = [0.0_dp, -1.0_dp, -1.0_dp]
        b = [4.0_dp, 4.0_dp, 4.0_dp]
        c = [-1.0_dp, -1.0_dp, 0.0_dp]
        d = [3.0_dp, 2.0_dp, 3.0_dp]
        call solve_tridiag(a, b, c, d, x, 3)
        call assert_close_dp(x(1), 1.0_dp, 1.0e-11_dp)
        call assert_close_dp(x(2), 1.0_dp, 1.0e-11_dp)
        call assert_close_dp(x(3), 1.0_dp, 1.0e-11_dp)
    end block
    block
        integer :: st
        call check_pos_n(1, st)
        if (st /= 0) error stop 'val failed'
    end block
end program test_unit
