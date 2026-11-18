program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_flv_types
    use m_flv_core
    use m_flv_inv
    use m_flv_val
    implicit none
real(dp) :: A(3, 3), c(0:3)
    A = reshape([2.0_dp, 0.0_dp, 0.0_dp, 0.0_dp, 3.0_dp, 0.0_dp, 0.0_dp, 0.0_dp, 4.0_dp], [3, 3])
    call faddeev_leverrier_3x3(A, c)
    call assert_close_dp(c(2), -9.0_dp, 1.0e-12_dp)
    call assert_close_dp(c(1), 26.0_dp, 1.0e-12_dp)
    call assert_close_dp(c(0), -24.0_dp, 1.0e-12_dp)
    block
        integer :: st
        call check_pos_n(1, st)
        if (st /= 0) error stop 'val failed'
    end block
end program test_unit
