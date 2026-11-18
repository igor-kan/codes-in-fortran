program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ms4_types
    use m_ms4_core
    use m_ms4_conc
    use m_ms4_inv
    implicit none
call assert_close_dp(simpson_corrector_step(0.0_dp, 1.0_dp, 1.0_dp, 1.0_dp, 0.5_dp), 1.0_dp, 1.0e-12_dp)
    block
        real(dp) :: m(2, 2), nrms(2)
        m = reshape([1.0_dp, 2.0_dp, 3.0_dp, 4.0_dp], [2, 2])
        call batch_norms(m, nrms)
        call assert_close_dp(nrms(1), 5.0_dp, 1.0e-12_dp)
    end block
end program test_props
