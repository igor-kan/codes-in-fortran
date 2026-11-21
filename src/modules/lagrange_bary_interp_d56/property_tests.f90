program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_bary_types
    use m_bary_core
    use m_bary_conc
    use m_bary_inv
    implicit none
block
        real(dp) :: xs(3), ys(3)
        xs = [-1.0_dp, 0.0_dp, 2.0_dp]
        ys = [1.0_dp, 0.0_dp, 4.0_dp]
        call assert_close_dp(bary_eval(xs, ys, 3, 1.5_dp), 2.25_dp, 1.0e-11_dp)
    end block
    block
        real(dp) :: m(2, 2), nrms(2)
        m = reshape([1.0_dp, 2.0_dp, 3.0_dp, 4.0_dp], [2, 2])
        call batch_norms(m, nrms)
        call assert_close_dp(nrms(1), 5.0_dp, 1.0e-12_dp)
    end block
end program test_props
