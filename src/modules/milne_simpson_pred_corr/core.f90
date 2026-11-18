module m_ms4_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ms4_types
    use m_ms4_err
    use m_ms4_ifc
    implicit none
contains
pure function simpson_corrector_step(ym1, f_m1, f_0, f_p1, h) result(yp1)
        real(dp), intent(in) :: ym1, f_m1, f_0, f_p1, h
        real(dp) :: yp1
        yp1 = ym1 + (h / 3.0_dp) * (f_m1 + 4.0_dp * f_0 + f_p1)
    end function simpson_corrector_step

    pure function integrate_exp_ms4(n_steps, h) result(y_final)
        integer, intent(in) :: n_steps
        real(dp), intent(in) :: h
        real(dp) :: y_final, y(0:n_steps), yp
        integer :: i
        y(0) = 1.0_dp
        do i = 1, 3
            y(i) = exp(real(i, dp) * h)
        end do
        do i = 3, n_steps - 1
            yp = y(i - 3) + (4.0_dp * h / 3.0_dp) * (2.0_dp * y(i) - y(i - 1) + 2.0_dp * y(i - 2))
            y(i + 1) = simpson_corrector_step(y(i - 1), y(i - 1), y(i), yp, h)
        end do
        y_final = y(n_steps)
    end function integrate_exp_ms4
end module m_ms4_core
