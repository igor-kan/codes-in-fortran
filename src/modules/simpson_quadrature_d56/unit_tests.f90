program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_simp_types
    use m_simp_core
    use m_simp_inv
    use m_simp_val
    implicit none
block
        real(dp) :: got, exact
        got = simpson_cubics(0.0_dp, 2.0_dp, 10)
        exact = (2.0_dp**4)/4.0_dp + 2.0_dp*(2.0_dp**3)/3.0_dp + 2.0_dp
        call assert_close_dp(got, exact, 1.0e-11_dp)
    end block
    block
        integer :: st
        call check_pos_n(1, st)
        if (st /= 0) error stop 'val failed'
    end block
end program test_unit
