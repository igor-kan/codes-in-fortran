program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_poweig_types
    use m_poweig_core
    use m_poweig_inv
    use m_poweig_val
    implicit none
block
        real(dp) :: A(3, 3), lam
        A = reshape([6.0_dp, 2.0_dp, 0.0_dp, 2.0_dp, 3.0_dp, 0.0_dp, 0.0_dp, 0.0_dp, 1.0_dp], [3, 3])
        lam = dominant_eig_3x3(A, [1.0_dp, 1.0_dp, 0.5_dp], 40)
        call assert_close_dp(lam, 7.0_dp, 1.0e-10_dp)
    end block
    block
        integer :: st
        call check_pos_n(1, st)
        if (st /= 0) error stop 'val failed'
    end block
end program test_unit
