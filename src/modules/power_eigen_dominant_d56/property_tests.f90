program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_poweig_types
    use m_poweig_core
    use m_poweig_conc
    use m_poweig_inv
    implicit none
block
        real(dp) :: d(3, 3), lam
        d = reshape([5.0_dp,0.0_dp,0.0_dp, 0.0_dp,2.0_dp,0.0_dp, 0.0_dp,0.0_dp,1.0_dp], [3,3])
        lam = dominant_eigval(d, 3, 50)
        call assert_close_dp(lam, 5.0_dp, 1.0e-8_dp)
    end block
    block
        real(dp) :: m(2, 2), nrms(2)
        m = reshape([1.0_dp, 2.0_dp, 3.0_dp, 4.0_dp], [2, 2])
        call batch_norms(m, nrms)
        call assert_close_dp(nrms(1), 5.0_dp, 1.0e-12_dp)
    end block
end program test_props
