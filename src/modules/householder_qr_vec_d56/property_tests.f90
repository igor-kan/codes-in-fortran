program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_hhqr_types
    use m_hhqr_core
    use m_hhqr_conc
    use m_hhqr_inv
    implicit none
block
        real(dp) :: x(3), y(3)
        x = [1.0_dp, 2.0_dp, 2.0_dp]
        call householder_reflect(x, y, 3)
        call assert_close_dp(sum(y*y), sum(x*x), 1.0e-11_dp)
    end block
    block
        real(dp) :: m(2, 2), nrms(2)
        m = reshape([1.0_dp, 2.0_dp, 3.0_dp, 4.0_dp], [2, 2])
        call batch_norms(m, nrms)
        call assert_close_dp(nrms(1), 5.0_dp, 1.0e-12_dp)
    end block
end program test_props
