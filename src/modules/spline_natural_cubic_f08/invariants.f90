module m_spl_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_spl_core
    use m_spl_fast
    implicit none
contains
    function verify_c2_continuity(n, x, y, b, c, d, tol) result(ok)
        integer, intent(in) :: n
        real(dp), intent(in) :: x(n), y(n), b(n), c(n), d(n), tol
        logical :: ok
        integer :: i
        real(dp) :: h, y_r, d1_l, d1_r
        ok = (abs(c(1)) <= tol .and. abs(c(n)) <= tol)
        do i = 1, n - 1
            h = x(i + 1) - x(i)
            y_r = y(i) + h * (b(i) + h * (c(i) + h * d(i)))
            if (abs(y_r - y(i + 1)) > tol) ok = .false.
            if (i < n - 1) then
                d1_l = b(i) + 2.0_dp * c(i) * h + 3.0_dp * d(i) * h * h
                d1_r = b(i + 1)
                if (abs(d1_l - d1_r) > tol) ok = .false.
            end if
        end do
    end function verify_c2_continuity
end module m_spl_inv
