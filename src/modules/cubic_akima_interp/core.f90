module m_akm_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_akm_types
    use m_akm_err
    implicit none
contains
    subroutine fit_akima_spline(n, x, y, segs, status)
        integer, intent(in) :: n
        real(dp), intent(in) :: x(n), y(n)
        type(akima_seg_t), intent(out) :: segs(n - 1)
        integer, intent(out) :: status
        real(dp) :: m(-1:n+1), t(n), w1, w2, dx
        integer :: i

        if (n < 5) then
            status = ERR_DIM
            return
        end if
        status = ERR_OK
        do i = 1, n - 1
            m(i) = (y(i + 1) - y(i)) / (x(i + 1) - x(i))
        end do
        m(0) = 2.0_dp * m(1) - m(2)
        m(-1) = 2.0_dp * m(0) - m(1)
        m(n) = 2.0_dp * m(n - 1) - m(n - 2)
        m(n + 1) = 2.0_dp * m(n) - m(n - 1)

        do i = 1, n
            w1 = abs(m(i + 1) - m(i))
            w2 = abs(m(i - 1) - m(i - 2))
            if (w1 + w2 > 1.0e-30_dp) then
                t(i) = (w1 * m(i - 1) + w2 * m(i)) / (w1 + w2)
            else
                t(i) = 0.5_dp * (m(i - 1) + m(i))
            end if
        end do

        do i = 1, n - 1
            dx = x(i + 1) - x(i)
            segs(i)%x0 = x(i)
            segs(i)%c0 = y(i)
            segs(i)%c1 = t(i)
            segs(i)%c2 = (3.0_dp * m(i) - 2.0_dp * t(i) - t(i + 1)) / dx
            segs(i)%c3 = (t(i) + t(i + 1) - 2.0_dp * m(i)) / (dx * dx)
        end do
    end subroutine fit_akima_spline

    pure function eval_akima(n, segs, xq) result(yq)
        integer, intent(in) :: n
        type(akima_seg_t), intent(in) :: segs(n - 1)
        real(dp), intent(in) :: xq
        real(dp) :: yq, dx
        integer :: lo, hi, mid
        lo = 1
        hi = n - 1
        do while (lo < hi)
            mid = (lo + hi + 1) / 2
            if (segs(mid)%x0 <= xq) then
                lo = mid
            else
                hi = mid - 1
            end if
        end do
        dx = xq - segs(lo)%x0
        yq = segs(lo)%c0 + dx * (segs(lo)%c1 + dx * (segs(lo)%c2 + dx * segs(lo)%c3))
    end function eval_akima
end module m_akm_core
