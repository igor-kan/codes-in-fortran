program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_bary_types
    use m_bary_core
    use m_bary_inv
    use m_bary_val
    implicit none
block
        real(dp) :: xs(4) = [0.0_dp, 1.0_dp, 2.0_dp, 3.0_dp], ys(4)
        ys = xs**3 - 2.0_dp * xs + 1.0_dp
        call assert_close_dp(eval_bary_4pt(xs, ys, 1.5_dp), 1.5_dp**3 - 2.0_dp, 1.0e-12_dp)
    end block
    block
        integer :: st
        call check_pos_n(1, st)
        if (st /= 0) error stop 'val failed'
    end block
end program test_unit
