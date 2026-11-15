module m_akm_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_akm_types
    implicit none
contains
    pure function eval_akima_deriv(n, segs, xq) result(dy)
        integer, intent(in) :: n
        type(akima_seg_t), intent(in) :: segs(n - 1)
        real(dp), intent(in) :: xq
        real(dp) :: dy, dx
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
        dy = segs(lo)%c1 + dx * (2.0_dp * segs(lo)%c2 + 3.0_dp * dx * segs(lo)%c3)
    end function eval_akima_deriv
end module m_akm_fast
