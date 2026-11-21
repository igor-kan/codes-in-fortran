program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_chol_types
    use m_chol_core
    use m_chol_conc
    use m_chol_inv
    implicit none
block
        real(dp) :: a(2, 2), lmat(2, 2), rec(2, 2)
        a = reshape([9.0_dp, 3.0_dp, 3.0_dp, 10.0_dp], [2, 2])
        call cholesky_factor(a, lmat, 2)
        rec = matmul(lmat, transpose(lmat))
        call assert_close_dp(rec(1, 2), 3.0_dp, 1.0e-11_dp)
    end block
    block
        real(dp) :: m(2, 2), nrms(2)
        m = reshape([1.0_dp, 2.0_dp, 3.0_dp, 4.0_dp], [2, 2])
        call batch_norms(m, nrms)
        call assert_close_dp(nrms(1), 5.0_dp, 1.0e-12_dp)
    end block
end program test_props
