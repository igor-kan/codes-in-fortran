program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_flv_types
    use m_flv_core
    use m_flv_conc
    use m_flv_inv
    implicit none
real(dp) :: A(3, 3), c(0:3)
    A = reshape([1.0_dp, 0.0_dp, 0.0_dp, 0.0_dp, 1.0_dp, 0.0_dp, 0.0_dp, 0.0_dp, 1.0_dp], [3, 3])
    call faddeev_leverrier_3x3(A, c)
    call assert_close_dp(c(0), -1.0_dp, 1.0e-12_dp)
    block
        real(dp) :: m(2, 2), nrms(2)
        m = reshape([1.0_dp, 2.0_dp, 3.0_dp, 4.0_dp], [2, 2])
        call batch_norms(m, nrms)
        call assert_close_dp(nrms(1), 5.0_dp, 1.0e-12_dp)
    end block
end program test_props
