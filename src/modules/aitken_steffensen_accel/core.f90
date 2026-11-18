module m_ait_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ait_types
    use m_ait_err
    use m_ait_ifc
    implicit none
contains
subroutine steffensen_solve(g, x0, tol, max_it, res)
        procedure(scalar_fn) :: g
        real(dp), intent(in) :: x0, tol
        integer, intent(in) :: max_it
        type(aitken_res_t), intent(out) :: res
        real(dp) :: x, x1, x2, d
        integer :: k
        x = x0
        do k = 1, max_it
            x1 = g(x)
            x2 = g(x1)
            d = x2 - 2.0_dp * x1 + x
            if (abs(d) > 1.0e-15_dp) x = x - (x1 - x)**2 / d
            if (abs(g(x) - x) <= tol) then
                res = aitken_res_t(x, k)
                return
            end if
        end do
        res = aitken_res_t(x, max_it)
    end subroutine steffensen_solve

    pure function g_cos(x) result(y)
        real(dp), intent(in) :: x
        real(dp) :: y
        y = cos(x)
    end function g_cos

    pure function g_sqrt2(x) result(y)
        real(dp), intent(in) :: x
        real(dp) :: y
        y = 0.5_dp * (x + 2.0_dp / x)
    end function g_sqrt2
end module m_ait_core
