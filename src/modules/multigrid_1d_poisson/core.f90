module m_mg_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    subroutine smooth_jacobi_1d(n, h, u, f, sweeps)
        integer, intent(in) :: n, sweeps
        real(dp), intent(in) :: h, f(0:n)
        real(dp), intent(inout) :: u(0:n)
        real(dp) :: unew(0:n), hh, w
        integer :: s, i
        hh = h * h
        w = 2.0_dp / 3.0_dp
        unew = u
        do s = 1, sweeps
            do i = 1, n - 1
                unew(i) = (1.0_dp - w) * u(i) + w * 0.5_dp * (u(i - 1) + u(i + 1) + hh * f(i))
            end do
            u(1:n-1) = unew(1:n-1)
        end do
    end subroutine smooth_jacobi_1d

    recursive subroutine vcycle_1d(n, h, u, f)
        integer, intent(in) :: n
        real(dp), intent(in) :: h, f(0:n)
        real(dp), intent(inout) :: u(0:n)
        real(dp) :: res(0:n), rc(0:n/2), ec(0:n/2)
        integer :: nc, i
        real(dp) :: invh2

        if (n <= 2) then
            if (n == 2) u(1) = 0.5_dp * h * h * f(1)
            return
        end if
        call smooth_jacobi_1d(n, h, u, f, 3)
        invh2 = 1.0_dp / (h * h)
        res = 0.0_dp
        do i = 1, n - 1
            res(i) = f(i) - (-u(i - 1) + 2.0_dp * u(i) - u(i + 1)) * invh2
        end do
        nc = n / 2
        rc = 0.0_dp
        do i = 1, nc - 1
            rc(i) = 0.25_dp * res(2 * i - 1) + 0.5_dp * res(2 * i) + 0.25_dp * res(2 * i + 1)
        end do
        ec = 0.0_dp
        call vcycle_1d(nc, 2.0_dp * h, ec, rc)
        do i = 1, nc - 1
            u(2 * i) = u(2 * i) + ec(i)
        end do
        do i = 0, nc - 1
            u(2 * i + 1) = u(2 * i + 1) + 0.5_dp * (ec(i) + ec(i + 1))
        end do
        call smooth_jacobi_1d(n, h, u, f, 3)
    end subroutine vcycle_1d
end module m_mg_core
