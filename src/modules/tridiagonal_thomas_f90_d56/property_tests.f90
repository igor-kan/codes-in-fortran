program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_tdma_types
    use m_tdma_core
    use m_tdma_conc
    use m_tdma_inv
    implicit none
block
        real(dp) :: a(3), b(3), c(3), d(3), x(3), res1
        a = [0.0_dp, 1.0_dp, 1.0_dp]
        b = [5.0_dp, 5.0_dp, 5.0_dp]
        c = [1.0_dp, 1.0_dp, 0.0_dp]
        d = [7.0_dp, 14.0_dp, 17.0_dp]
        call solve_tridiag(a, b, c, d, x, 3)
        res1 = b(2)*x(2) + a(2)*x(1) + c(2)*x(3) - d(2)
        call assert_close_dp(res1, 0.0_dp, 1.0e-11_dp)
    end block
    block
        real(dp) :: m(2, 2), nrms(2)
        m = reshape([1.0_dp, 2.0_dp, 3.0_dp, 4.0_dp], [2, 2])
        call batch_norms(m, nrms)
        call assert_close_dp(nrms(1), 5.0_dp, 1.0e-12_dp)
    end block
end program test_props
