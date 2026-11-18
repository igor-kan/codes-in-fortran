program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_rqi_types
    use m_rqi_core
    use m_rqi_inv
    use m_rqi_val
    implicit none
real(dp) :: A(2, 2)
    type(eig2_t) :: e
    A = reshape([4.0_dp, 1.0_dp, 1.0_dp, 4.0_dp], [2, 2])
    call rayleigh_2x2(A, [1.0_dp, 0.8_dp], 6, e)
    call assert_close_dp(e%lam, 5.0_dp, 1.0e-10_dp)
    block
        integer :: st
        call check_pos_n(1, st)
        if (st /= 0) error stop 'val failed'
    end block
end program test_unit
