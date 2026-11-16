module m_spl_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_spl_err
    implicit none
contains
    subroutine fit_natural_spline(n, x, y, b, c, d, code)
        integer, intent(in) :: n
        real(dp), intent(in) :: x(n), y(n)
        real(dp), intent(out) :: b(n), c(n), d(n)
        integer, intent(out) :: code
        real(dp) :: h(n), alpha(n), l(n), mu(n), z(n)
        integer :: i

        if (n < 3) then
            code = ERR_DIM
            return
        end if
        do i = 1, n - 1
            h(i) = x(i + 1) - x(i)
            if (h(i) <= 0.0_dp) then
                code = ERR_SING
                return
            end if
        end do
        alpha = 0.0_dp
        do i = 2, n - 1
            alpha(i) = (3.0_dp / h(i)) * (y(i + 1) - y(i)) - (3.0_dp / h(i - 1)) * (y(i) - y(i - 1))
        end do
        l(1) = 1.0_dp
        mu(1) = 0.0_dp
        z(1) = 0.0_dp
        do i = 2, n - 1
            l(i) = 2.0_dp * (x(i + 1) - x(i - 1)) - h(i - 1) * mu(i - 1)
            mu(i) = h(i) / l(i)
            z(i) = (alpha(i) - h(i - 1) * z(i - 1)) / l(i)
        end do
        l(n) = 1.0_dp
        z(n) = 0.0_dp
        c(n) = 0.0_dp
        b(n) = 0.0_dp
        d(n) = 0.0_dp
        do i = n - 1, 1, -1
            c(i) = z(i) - mu(i) * c(i + 1)
            b(i) = (y(i + 1) - y(i)) / h(i) - h(i) * (c(i + 1) + 2.0_dp * c(i)) / 3.0_dp
            d(i) = (c(i + 1) - c(i)) / (3.0_dp * h(i))
        end do
        code = ERR_OK
    end subroutine fit_natural_spline

    pure function eval_natural_spline(n, x, y, b, c, d, xq) result(val)
        integer, intent(in) :: n
        real(dp), intent(in) :: x(n), y(n), b(n), c(n), d(n), xq
        real(dp) :: val, dx
        integer :: lo, hi, mid, k
        lo = 1
        hi = n - 1
        do while (lo < hi)
            mid = (lo + hi + 1) / 2
            if (x(mid) <= xq) then
                lo = mid
            else
                hi = mid - 1
            end if
        end do
        k = lo
        dx = xq - x(k)
        val = y(k) + dx * (b(k) + dx * (c(k) + dx * d(k)))
    end function eval_natural_spline
end module m_spl_core
