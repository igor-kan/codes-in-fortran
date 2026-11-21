program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_bary_types
    use m_bary_core
    use m_bary_inv
    use m_bary_val
    implicit none
block
        real(dp) :: xs(3), ys(3), got
        xs = [0.0_dp, 1.0_dp, 3.0_dp]
        ys = [1.0_dp, 2.0_dp, 10.0_dp]
        got = bary_eval(xs, ys, 3, 2.0_dp)
        call assert_close_dp(got, 5.0_dp, 1.0e-11_dp)
    end block
    block
        integer :: st
        call check_pos_n(1, st)
        if (st /= 0) error stop 'val failed'
    end block
end program test_unit
