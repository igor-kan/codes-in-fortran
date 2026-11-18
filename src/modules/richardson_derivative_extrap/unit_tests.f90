program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_rde_types
    use m_rde_core
    use m_rde_inv
    use m_rde_val
    implicit none
call assert_close_dp(richardson_diff_sin(1.0_dp, 0.2_dp), cos(1.0_dp), 1.0e-12_dp)
    call assert_close_dp(richardson_diff_sin(0.0_dp, 0.1_dp), 1.0_dp, 1.0e-12_dp)
    block
        integer :: st
        call check_pos_n(1, st)
        if (st /= 0) error stop 'val failed'
    end block
end program test_unit
