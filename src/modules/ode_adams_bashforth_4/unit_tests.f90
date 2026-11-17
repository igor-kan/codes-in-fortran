module m_ab4_test_fns
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function rhs_exp(t, y) result(dy)
        real(dp), intent(in) :: t, y
        real(dp) :: dy
        dy = y + 0.0_dp * t
    end function rhs_exp
end module m_ab4_test_fns
program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ab4_types
    use m_ab4_core
    use m_ab4_inv
    use m_ab4_test_fns
    implicit none
    integer, parameter :: n = 40
    real(dp) :: th(0:n), yh(0:n)
    integer :: st
    call integrate_ab4(rhs_exp, ab4_cfg_t(0.0_dp, 0.025_dp, n), 1.0_dp, th, yh, st)
    if (st /= 0) error stop 'ab4 failed'
    call check_global_error(yh(n), exp(1.0_dp), 1.0e-5_dp)
end program test_unit
