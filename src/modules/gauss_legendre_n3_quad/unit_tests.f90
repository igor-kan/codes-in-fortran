program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gl3_types
    use m_gl3_core
    use m_gl3_inv
    use m_gl3_val
    implicit none
call assert_close_dp(gl3_integrate_poly5(0.0_dp, 2.0_dp), (64.0_dp / 6.0_dp) + 8.0_dp, 1.0e-12_dp)
    block
        integer :: st
        call check_pos_n(1, st)
        if (st /= 0) error stop 'val failed'
    end block
end program test_unit
