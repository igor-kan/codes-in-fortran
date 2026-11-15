module m_sor_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_sor_types
    use m_sor_err
    implicit none
contains
    subroutine solve_poisson_redblack(nx, ny, h, rhs, cfg, u, rep)
        integer, intent(in) :: nx, ny
        real(dp), intent(in) :: h, rhs(nx, ny)
        type(sor_config_t), intent(in) :: cfg
        real(dp), intent(inout) :: u(nx, ny)
        type(sor_report_t), intent(out) :: rep
        real(dp) :: h2, w, gs, res, maxr
        integer :: iter, i, j, color

        rep%iters = 0
        rep%status = ERR_OK
        rep%max_residual = 0.0_dp
        h2 = h * h
        w = cfg%omega

        do iter = 1, cfg%max_iter
            do color = 0, 1
                do j = 2, ny - 1
                    do i = 2, nx - 1
                        if (mod(i + j, 2) == color) then
                            gs = 0.25_dp * (u(i - 1, j) + u(i + 1, j) + &
                                            u(i, j - 1) + u(i, j + 1) + h2 * rhs(i, j))
                            u(i, j) = (1.0_dp - w) * u(i, j) + w * gs
                        end if
                    end do
                end do
            end do
            maxr = 0.0_dp
            do j = 2, ny - 1
                do i = 2, nx - 1
                    res = abs((4.0_dp * u(i, j) - u(i - 1, j) - u(i + 1, j) - &
                               u(i, j - 1) - u(i, j + 1)) / h2 - rhs(i, j))
                    if (res > maxr) maxr = res
                end do
            end do
            rep%iters = iter
            rep%max_residual = maxr
            if (maxr <= cfg%tol) return
        end do
        rep%status = ERR_NO_CONV
    end subroutine solve_poisson_redblack
end module m_sor_core
