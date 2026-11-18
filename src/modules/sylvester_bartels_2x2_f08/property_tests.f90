program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_syl_types
    use m_syl_core
    use m_syl_conc
    use m_syl_inv
    implicit none
real(dp) :: X(2, 2), C(2, 2)
    C = reshape([4.0_dp, 4.0_dp, 4.0_dp, 4.0_dp], [2, 2])
    call solve_diagonal_sylvester_2x2([1.0_dp, 1.0_dp], [1.0_dp, 1.0_dp], C, X)
    call assert_close_dp(X(1, 1), 2.0_dp, 1.0e-12_dp)
    block
        real(dp) :: m(2, 2), nrms(2)
        m = reshape([1.0_dp, 2.0_dp, 3.0_dp, 4.0_dp], [2, 2])
        call batch_norms(m, nrms)
        call assert_close_dp(nrms(1), 5.0_dp, 1.0e-12_dp)
    end block
end program test_props
