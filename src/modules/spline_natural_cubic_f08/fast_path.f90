module m_spl_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_spl_core
    implicit none
contains
    pure function eval_derivative(n, x, b, c, d, xq) result(yp)
        integer, intent(in) :: n
        real(dp), intent(in) :: x(n), b(n), c(n), d(n), xq
        real(dp) :: yp, dx
        integer :: lo, hi, mid
        lo = 1; hi = n - 1
        do while (lo < hi)
            mid = (lo + hi + 1) / 2
            if (x(mid) <= xq) then
                lo = mid
            else
                hi = mid - 1
            end if
        end do
        dx = xq - x(lo)
        yp = b(lo) + dx * (2.0_dp * c(lo) + 3.0_dp * dx * d(lo))
    end function eval_derivative
end module m_spl_fast
