module m_cgf_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function relative_l2_residual(n, a, x, b) result(rel)
        integer, intent(in) :: n
        real(dp), intent(in) :: a(n, n), x(n), b(n)
        real(dp) :: rel, r(n), bn
        r = b - matmul(a, x)
        bn = max(1.0_dp, sqrt(sum(b * b)))
        rel = sqrt(sum(r * r)) / bn
    end function relative_l2_residual
end module m_cgf_fast
