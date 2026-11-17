module m_ab4_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ab4_types
    use m_ab4_ifc
    use m_ab4_err
    implicit none
contains
    pure function rk4_step(f, t, y, h) result(y_next)
        procedure(ode_rhs) :: f
        real(dp), intent(in) :: t, y, h
        real(dp) :: y_next, k1, k2, k3, k4
        k1 = f(t, y)
        k2 = f(t + 0.5_dp * h, y + 0.5_dp * h * k1)
        k3 = f(t + 0.5_dp * h, y + 0.5_dp * h * k2)
        k4 = f(t + h, y + h * k3)
        y_next = y + (h / 6.0_dp) * (k1 + 2.0_dp * k2 + 2.0_dp * k3 + k4)
    end function rk4_step

    subroutine integrate_ab4(f, cfg, y0, t_hist, y_hist, status)
        procedure(ode_rhs) :: f
        type(ab4_cfg_t), intent(in) :: cfg
        real(dp), intent(in) :: y0
        real(dp), intent(out) :: t_hist(0:cfg%steps), y_hist(0:cfg%steps)
        integer, intent(out) :: status
        real(dp) :: fn(0:3), h, tc, yc
        integer :: k, starter
        if (cfg%steps < 4 .or. cfg%h <= 0.0_dp) then
            status = ERR_DIM
            return
        end if
        status = ERR_OK
        h = cfg%h
        t_hist(0) = cfg%t0
        y_hist(0) = y0
        fn(0) = f(t_hist(0), y0)
        starter = min(3, cfg%steps)
        do k = 1, starter
            yc = rk4_step(f, t_hist(k - 1), y_hist(k - 1), h)
            tc = cfg%t0 + real(k, dp) * h
            t_hist(k) = tc
            y_hist(k) = yc
            fn(k) = f(tc, yc)
        end do
        do k = 4, cfg%steps
            yc = y_hist(k - 1) + (h / 24.0_dp) * (55.0_dp * fn(3) - &
                59.0_dp * fn(2) + 37.0_dp * fn(1) - 9.0_dp * fn(0))
            tc = cfg%t0 + real(k, dp) * h
            t_hist(k) = tc
            y_hist(k) = yc
            fn(0) = fn(1); fn(1) = fn(2); fn(2) = fn(3)
            fn(3) = f(tc, yc)
        end do
    end subroutine integrate_ab4
end module m_ab4_core
