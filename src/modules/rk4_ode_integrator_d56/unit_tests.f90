program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_rk4_types
    use m_rk4_core
    use m_rk4_inv
    use m_rk4_val
    implicit none
block
        real(dp) :: got, exact
        got = rk4_exp_integrate(1.0_dp, -1.0_dp, 0.05_dp, 20)
        exact = exp(-1.0_dp)
        call assert_close_dp(got, exact, 1.0e-6_dp)
    end block
    block
        integer :: st
        call check_pos_n(1, st)
        if (st /= 0) error stop 'val failed'
    end block
end program test_unit
