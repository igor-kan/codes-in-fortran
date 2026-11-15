module m_brg_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_brg_types
    use m_brg_err
    implicit none
contains
    pure function rusanov_flux(ul, ur) result(flux)
        real(dp), intent(in) :: ul, ur
        real(dp) :: flux, amax
        amax = max(abs(ul), abs(ur))
        flux = 0.5_dp * (0.5_dp * ul * ul + 0.5_dp * ur * ur) - 0.5_dp * amax * (ur - ul)
    end function rusanov_flux

    subroutine step_burgers_periodic(n, p, u, status)
        integer, intent(in) :: n
        type(burgers_params_t), intent(in) :: p
        real(dp), intent(inout) :: u(n)
        integer, intent(out) :: status
        real(dp) :: unext(n), f_r, f_l, diff, cfl
        integer :: i, ip1, im1

        status = ERR_OK
        cfl = maxval(abs(u)) * p%dt / p%dx + 2.0_dp * p%viscosity * p%dt / (p%dx * p%dx)
        if (cfl > 0.99_dp) then
            status = ERR_NO_CONV
            return
        end if
        do i = 1, n
            ip1 = merge(1, i + 1, i == n)
            im1 = merge(n, i - 1, i == 1)
            f_r = rusanov_flux(u(i), u(ip1))
            f_l = rusanov_flux(u(im1), u(i))
            diff = p%viscosity * (u(ip1) - 2.0_dp * u(i) + u(im1)) / (p%dx * p%dx)
            unext(i) = u(i) - (p%dt / p%dx) * (f_r - f_l) + p%dt * diff
        end do
        u = unext
    end subroutine step_burgers_periodic
end module m_brg_core
