program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_hhqr_types
    use m_hhqr_core
    use m_hhqr_inv
    use m_hhqr_val
    implicit none
block
        real(dp) :: x(3), y(3)
        x = [3.0_dp, 4.0_dp, 0.0_dp]
        call householder_reflect(x, y, 3)
        call assert_close_dp(abs(y(1)), 5.0_dp, 1.0e-11_dp)
        call assert_close_dp(y(2), 0.0_dp, 1.0e-11_dp)
        call assert_close_dp(y(3), 0.0_dp, 1.0e-11_dp)
    end block
    block
        integer :: st
        call check_pos_n(1, st)
        if (st /= 0) error stop 'val failed'
    end block
end program test_unit
