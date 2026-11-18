program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ms4_types
    use m_ms4_core
    use m_ms4_inv
    use m_ms4_val
    implicit none
call assert_close_dp(integrate_exp_ms4(20, 0.05_dp), exp(1.0_dp), 1.0e-6_dp)
    block
        integer :: st
        call check_pos_n(1, st)
        if (st /= 0) error stop 'val failed'
    end block
end program test_unit
