module m_sor_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure subroutine redblack_concurrent_sweep(nx, ny, h2, w, rhs, u, color)
        integer, intent(in) :: nx, ny, color
        real(dp), intent(in) :: h2, w, rhs(nx, ny)
        real(dp), intent(inout) :: u(nx, ny)
        integer :: i, j
        real(dp) :: gs
        do concurrent (j = 2:(ny - 1), i = 2:(nx - 1))
            if (mod(i + j, 2) == color) then
                gs = 0.25_dp * (u(i - 1, j) + u(i + 1, j) + &
                                u(i, j - 1) + u(i, j + 1) + h2 * rhs(i, j))
                u(i, j) = (1.0_dp - w) * u(i, j) + w * gs
            end if
        end do
    end subroutine redblack_concurrent_sweep
end module m_sor_conc
