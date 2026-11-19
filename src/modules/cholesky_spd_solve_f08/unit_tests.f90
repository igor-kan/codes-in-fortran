program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_chol_types
    use m_chol_core
    use m_chol_inv
    use m_chol_val
    implicit none
block
        real(dp) :: A(3, 3), b(3), x(3), r(3)
        A = reshape([4.0_dp, 1.0_dp, 0.0_dp, 1.0_dp, 4.0_dp, 1.0_dp, 0.0_dp, 1.0_dp, 4.0_dp], [3, 3])
        b = [6.0_dp, 12.0_dp, 14.0_dp]
        call ldlt_solve_3x3(A, b, x)
        r = matmul(A, x) - b
        call assert_close_dp(maxval(abs(r)), 0.0_dp, 1.0e-12_dp)
    end block
    block
        integer :: st
        call check_pos_n(1, st)
        if (st /= 0) error stop 'val failed'
    end block
end program test_unit
