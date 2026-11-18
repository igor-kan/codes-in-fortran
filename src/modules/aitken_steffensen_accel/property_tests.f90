program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ait_types
    use m_ait_core
    use m_ait_conc
    use m_ait_inv
    implicit none
type(aitken_res_t) :: r
    call steffensen_solve(g_sqrt2, 1.5_dp, 1.0e-12_dp, 10, r)
    call assert_close_dp(r%root * r%root, 2.0_dp, 1.0e-11_dp)
    block
        real(dp) :: m(2, 2), nrms(2)
        m = reshape([1.0_dp, 2.0_dp, 3.0_dp, 4.0_dp], [2, 2])
        call batch_norms(m, nrms)
        call assert_close_dp(nrms(1), 5.0_dp, 1.0e-12_dp)
    end block
end program test_props
