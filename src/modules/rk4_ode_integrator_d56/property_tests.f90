program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_rk4_types
    use m_rk4_core
    use m_rk4_conc
    use m_rk4_inv
    implicit none
block
        real(dp) :: y_fwd, y_rev
        y_fwd = rk4_exp_integrate(2.0_dp, 0.5_dp, 0.01_dp, 50)
        y_rev = rk4_exp_integrate(y_fwd, -0.5_dp, 0.01_dp, 50)
        call assert_close_dp(y_rev, 2.0_dp, 1.0e-7_dp)
    end block
    block
        real(dp) :: m(2, 2), nrms(2)
        m = reshape([1.0_dp, 2.0_dp, 3.0_dp, 4.0_dp], [2, 2])
        call batch_norms(m, nrms)
        call assert_close_dp(nrms(1), 5.0_dp, 1.0e-12_dp)
    end block
end program test_props
