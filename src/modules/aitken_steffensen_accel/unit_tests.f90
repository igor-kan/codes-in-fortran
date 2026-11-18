program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ait_types
    use m_ait_core
    use m_ait_inv
    use m_ait_val
    implicit none
type(aitken_res_t) :: r
    call steffensen_solve(g_cos, 0.5_dp, 1.0e-12_dp, 20, r)
    call assert_close_dp(r%root, 0.7390851332151607_dp, 1.0e-11_dp)
    block
        integer :: st
        call check_pos_n(1, st)
        if (st /= 0) error stop 'val failed'
    end block
end program test_unit
