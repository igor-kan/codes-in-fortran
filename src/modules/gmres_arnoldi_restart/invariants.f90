module m_gmr_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    function true_residual_norm(n, a, b, x) result(norm)
        integer, intent(in) :: n
        real(dp), intent(in) :: a(n, n), b(n), x(n)
        real(dp) :: norm, r(n)
        r = b - matmul(a, x)
        norm = sqrt(dot_product(r, r))
    end function true_residual_norm
end module m_gmr_inv
