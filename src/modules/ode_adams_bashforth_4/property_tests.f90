module m_ab4_prop_fns
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function rhs_lin(t, y) result(dy)
        real(dp), intent(in) :: t, y
        real(dp) :: dy
        dy = -y + 0.0_dp * t
    end function rhs_lin
end module m_ab4_prop_fns
program test_props
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ab4_types
    use m_ab4_conc
    use m_ab4_prop_fns
    implicit none
    real(dp) :: y0s(2) = [1.0_dp, 2.0_dp], yfs(2)
    call sweep_initial_values(rhs_lin, ab4_cfg_t(0.0_dp, 0.02_dp, 50), 2, y0s, yfs)
    if (abs(yfs(2) - 2.0_dp * yfs(1)) > 1.0e-12_dp) error stop 'ODE linearity broken'
end program test_props
