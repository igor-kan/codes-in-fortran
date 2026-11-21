program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_simp_types
    use m_simp_core
    use m_simp_conc
    use m_simp_inv
    implicit none
block
        real(dp) :: s1, s2
        s1 = simpson_cubics(0.0_dp, 1.0_dp, 4)
        s2 = simpson_cubics(0.0_dp, 1.0_dp, 20)
        call assert_close_dp(s1, s2, 1.0e-12_dp)
    end block
    block
        real(dp) :: m(2, 2), nrms(2)
        m = reshape([1.0_dp, 2.0_dp, 3.0_dp, 4.0_dp], [2, 2])
        call batch_norms(m, nrms)
        call assert_close_dp(nrms(1), 5.0_dp, 1.0e-12_dp)
    end block
end program test_props
