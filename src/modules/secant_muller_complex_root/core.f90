module m_sec_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_sec_types
    use m_sec_ifc
    use m_sec_err
    implicit none
contains
    subroutine solve_secant(f, x0, x1, tol, max_it, res)
        procedure(fn_scalar) :: f
        real(dp), intent(in) :: x0, x1, tol
        integer, intent(in) :: max_it
        type(root_res_t), intent(out) :: res
        real(dp) :: a, b, fa, fb, c, denom
        integer :: k
        a = x0; b = x1; fa = f(a); fb = f(b)
        res%status = ERR_OK
        do k = 1, max_it
            if (abs(fb) <= tol) then
                res = root_res_t(b, fb, k - 1, ERR_OK)
                return
            end if
            denom = fb - fa
            if (abs(denom) < 1.0e-30_dp) then
                res = root_res_t(b, fb, k, ERR_SING)
                return
            end if
            c = b - fb * (b - a) / denom
            a = b; fa = fb
            b = c; fb = f(b)
            res%iters = k
        end do
        res = root_res_t(b, fb, max_it, merge(ERR_OK, ERR_CONV, abs(fb) <= tol))
    end subroutine solve_secant
end module m_sec_core
