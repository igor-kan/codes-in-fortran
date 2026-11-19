program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_bary_types
    use m_bary_core
    use m_bary_conc
    use m_bary_inv
    implicit none
block
        real(dp) :: xs(4) = [-1.0_dp, 0.0_dp, 1.0_dp, 2.0_dp], ys(4)
        ys = [5.0_dp, 5.0_dp, 5.0_dp, 5.0_dp]
        call assert_close_dp(eval_bary_4pt(xs, ys, 0.7_dp), 5.0_dp, 1.0e-13_dp)
    end block
    block
        real(dp) :: m(2, 2), nrms(2)
        m = reshape([1.0_dp, 2.0_dp, 3.0_dp, 4.0_dp], [2, 2])
        call batch_norms(m, nrms)
        call assert_close_dp(nrms(1), 5.0_dp, 1.0e-12_dp)
    end block
end program test_props
