program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_syl_types
    use m_syl_core
    use m_syl_inv
    use m_syl_val
    implicit none
real(dp) :: ad(2) = [2.0_dp, 3.0_dp], bd(2) = [1.0_dp, 5.0_dp]
    real(dp) :: C(2, 2), X(2, 2), A(2, 2), B(2, 2), R(2, 2)
    C = reshape([6.0_dp, 8.0_dp, 14.0_dp, 16.0_dp], [2, 2])
    call solve_diagonal_sylvester_2x2(ad, bd, C, X)
    A = reshape([2.0_dp, 0.0_dp, 0.0_dp, 3.0_dp], [2, 2])
    B = reshape([1.0_dp, 0.0_dp, 0.0_dp, 5.0_dp], [2, 2])
    R = matmul(A, X) + matmul(X, B) - C
    call assert_close_dp(maxval(abs(R)), 0.0_dp, 1.0e-12_dp)
    block
        integer :: st
        call check_pos_n(1, st)
        if (st /= 0) error stop 'val failed'
    end block
end program test_unit
