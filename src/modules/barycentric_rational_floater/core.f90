module m_fh_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_fh_types
    use m_fh_err
    use m_fh_ifc
    implicit none
contains
pure function fh_eval_d1(xs, ys, xq) result(val)
        real(dp), intent(in) :: xs(:), ys(:), xq
        real(dp) :: val, w(size(xs)), num, den, diff
        integer :: i, n
        n = size(xs)
        do i = 1, n
            if (abs(xq - xs(i)) < 1.0e-14_dp) then
                val = ys(i); return
            end if
            w(i) = merge(1.0_dp, -1.0_dp, mod(i, 2) == 1)
            if (i == 1 .or. i == n) w(i) = 0.5_dp * w(i)
        end do
        num = 0.0_dp; den = 0.0_dp
        do i = 1, n
            diff = w(i) / (xq - xs(i))
            num = num + diff * ys(i)
            den = den + diff
        end do
        val = num / den
    end function fh_eval_d1
end module m_fh_core
