program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_chol_types
    use m_chol_core
    use m_chol_conc
    use m_chol_inv
    implicit none
block
        real(dp) :: A(3, 3), b(3), x(3)
        A = reshape([2.0_dp, 0.0_dp, 0.0_dp, 0.0_dp, 3.0_dp, 0.0_dp, 0.0_dp, 0.0_dp, 4.0_dp], [3, 3])
        b = [4.0_dp, 9.0_dp, 16.0_dp]
        call ldlt_solve_3x3(A, b, x)
        call assert_close_dp(sum(x), 9.0_dp, 1.0e-12_dp)
    end block
    block
        real(dp) :: m(2, 2), nrms(2)
        m = reshape([1.0_dp, 2.0_dp, 3.0_dp, 4.0_dp], [2, 2])
        call batch_norms(m, nrms)
        call assert_close_dp(nrms(1), 5.0_dp, 1.0e-12_dp)
    end block
end program test_props
