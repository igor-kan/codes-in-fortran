program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gh5_types
    use m_gh5_core
    use m_gh5_conc
    use m_gh5_inv
    implicit none
call assert_close_dp(gauss_hermite_5pt_even_pow(3), 0.0_dp, 1.0e-14_dp)
    block
        real(dp) :: m(2, 2), nrms(2)
        m = reshape([1.0_dp, 2.0_dp, 3.0_dp, 4.0_dp], [2, 2])
        call batch_norms(m, nrms)
        call assert_close_dp(nrms(1), 5.0_dp, 1.0e-12_dp)
    end block
end program test_props
