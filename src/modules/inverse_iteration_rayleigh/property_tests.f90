program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_rqi_types
    use m_rqi_core
    use m_rqi_conc
    use m_rqi_inv
    implicit none
real(dp) :: A(2, 2)
    type(eig2_t) :: e
    A = reshape([4.0_dp, 1.0_dp, 1.0_dp, 4.0_dp], [2, 2])
    call rayleigh_2x2(A, [1.0_dp, -0.8_dp], 6, e)
    call assert_close_dp(e%lam, 3.0_dp, 1.0e-10_dp)
    block
        real(dp) :: m(2, 2), nrms(2)
        m = reshape([1.0_dp, 2.0_dp, 3.0_dp, 4.0_dp], [2, 2])
        call batch_norms(m, nrms)
        call assert_close_dp(nrms(1), 5.0_dp, 1.0e-12_dp)
    end block
end program test_props
