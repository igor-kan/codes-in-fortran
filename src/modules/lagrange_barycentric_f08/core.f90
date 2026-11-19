module m_bary_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_bary_types
    use m_bary_err
    use m_bary_ifc
    implicit none
contains
pure function eval_bary_4pt(xs, ys, xq) result(val)
        real(dp), intent(in) :: xs(4), ys(4), xq
        real(dp) :: val, w(4), num, den, t
        integer :: i, j
        do i = 1, 4
            if (abs(xq - xs(i)) < 1.0e-14_dp) then
                val = ys(i); return
            end if
            w(i) = 1.0_dp
            do j = 1, 4
                if (i /= j) w(i) = w(i) / (xs(i) - xs(j))
            end do
        end do
        num = 0.0_dp; den = 0.0_dp
        do i = 1, 4
            t = w(i) / (xq - xs(i))
            num = num + t * ys(i)
            den = den + t
        end do
        val = num / den
    end function eval_bary_4pt
end module m_bary_core
