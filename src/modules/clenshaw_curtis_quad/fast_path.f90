module m_ccq_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function dot_quad(n, fvals, weights) result(res)
        integer, intent(in) :: n
        real(dp), intent(in) :: fvals(0:n), weights(0:n)
        real(dp) :: res
        res = dot_product(fvals, weights)
    end function dot_quad
end module m_ccq_fast
