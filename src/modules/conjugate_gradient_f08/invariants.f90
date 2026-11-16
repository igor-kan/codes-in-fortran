module m_cgf_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_cgf_fast
    implicit none
contains
    function check_cg_solution(n, a, x, b, tol) result(ok)
        integer, intent(in) :: n
        real(dp), intent(in) :: a(n, n), x(n), b(n), tol
        logical :: ok
        ok = (relative_l2_residual(n, a, x, b) <= tol)
    end function check_cg_solution
end module m_cgf_inv
