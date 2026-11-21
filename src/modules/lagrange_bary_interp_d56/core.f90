module m_bary_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_bary_types
    use m_bary_err
    use m_bary_ifc
    implicit none
contains
function bary_eval(xs, ys, n, xq) result(val)
        integer, intent(in) :: n
        real(dp), intent(in) :: xs(n), ys(n), xq
        real(dp) :: w(n), num, den, diff, val
        integer :: i, j
        do i = 1, n
            w(i) = 1.0_dp
            do j = 1, n
                if (j /= i) w(i) = w(i) / (xs(i) - xs(j))
            end do
        end do
        num = 0.0_dp
        den = 0.0_dp
        do i = 1, n
            diff = xq - xs(i)
            if (abs(diff) < 1.0e-14_dp) then
                val = ys(i)
                return
            end if
            num = num + (w(i) / diff) * ys(i)
            den = den + (w(i) / diff)
        end do
        val = num / den
    end function bary_eval
end module m_bary_core
