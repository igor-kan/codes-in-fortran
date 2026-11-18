program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_fh_types
    use m_fh_core
    use m_fh_conc
    use m_fh_inv
    implicit none
real(dp) :: xs(3) = [-1.0_dp, 0.0_dp, 1.0_dp], ys(3) = [2.0_dp, 2.0_dp, 2.0_dp]
    call assert_close_dp(fh_eval_d1(xs, ys, 0.37_dp), 2.0_dp, 1.0e-12_dp)
    block
        real(dp) :: m(2, 2), nrms(2)
        m = reshape([1.0_dp, 2.0_dp, 3.0_dp, 4.0_dp], [2, 2])
        call batch_norms(m, nrms)
        call assert_close_dp(nrms(1), 5.0_dp, 1.0e-12_dp)
    end block
end program test_props
