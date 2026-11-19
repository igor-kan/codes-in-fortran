program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gl3_types
    use m_gl3_core
    use m_gl3_conc
    use m_gl3_inv
    implicit none
call assert_close_dp(gl3_integrate_poly5(-1.0_dp, 1.0_dp), 0.0_dp, 1.0e-13_dp)
    block
        real(dp) :: m(2, 2), nrms(2)
        m = reshape([1.0_dp, 2.0_dp, 3.0_dp, 4.0_dp], [2, 2])
        call batch_norms(m, nrms)
        call assert_close_dp(nrms(1), 5.0_dp, 1.0e-12_dp)
    end block
end program test_props
