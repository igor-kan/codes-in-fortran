program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_fh_types
    use m_fh_core
    use m_fh_inv
    use m_fh_val
    implicit none
real(dp) :: xs(4) = [0.0_dp, 1.0_dp, 2.0_dp, 3.0_dp]
    real(dp) :: ys(4) = [1.0_dp, 3.0_dp, 5.0_dp, 7.0_dp]
    call assert_close_dp(fh_eval_d1(xs, ys, 1.5_dp), 4.0_dp, 1.0e-12_dp)
    call assert_close_dp(fh_eval_d1(xs, ys, 2.0_dp), 5.0_dp, 1.0e-12_dp)
    block
        integer :: st
        call check_pos_n(1, st)
        if (st /= 0) error stop 'val failed'
    end block
end program test_unit
