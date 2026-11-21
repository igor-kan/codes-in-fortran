program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_chol_types
    use m_chol_core
    use m_chol_inv
    use m_chol_val
    implicit none
block
        real(dp) :: a(3, 3), lmat(3, 3), rec(3, 3)
        a = reshape([4.0_dp, 2.0_dp, 0.0_dp, 2.0_dp, 5.0_dp, 2.0_dp, 0.0_dp, 2.0_dp, 5.0_dp], [3, 3])
        call cholesky_factor(a, lmat, 3)
        rec = matmul(lmat, transpose(lmat))
        call assert_close_dp(rec(2, 2), a(2, 2), 1.0e-11_dp)
        call assert_close_dp(rec(3, 2), a(3, 2), 1.0e-11_dp)
    end block
    block
        integer :: st
        call check_pos_n(1, st)
        if (st /= 0) error stop 'val failed'
    end block
end program test_unit
