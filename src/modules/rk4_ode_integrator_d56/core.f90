module m_rk4_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_rk4_types
    use m_rk4_err
    use m_rk4_ifc
    implicit none
contains
pure function rk4_exp_integrate(y0, lambda, h, steps) result(y)
        real(dp), intent(in) :: y0, lambda, h
        integer, intent(in) :: steps
        real(dp) :: y, k1, k2, k3, k4
        integer :: i
        y = y0
        do i = 1, steps
            k1 = lambda * y
            k2 = lambda * (y + 0.5_dp * h * k1)
            k3 = lambda * (y + 0.5_dp * h * k2)
            k4 = lambda * (y + h * k3)
            y = y + (h / 6.0_dp) * (k1 + 2.0_dp * k2 + 2.0_dp * k3 + k4)
        end do
    end function rk4_exp_integrate
end module m_rk4_core
