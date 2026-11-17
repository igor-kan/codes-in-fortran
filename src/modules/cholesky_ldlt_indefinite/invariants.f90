module m_ldlt_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ldlt_fast
    implicit none
contains
    subroutine verify_ldlt(n, a, lmat, dvec)
        integer, intent(in) :: n
        real(dp), intent(in) :: a(n, n), lmat(n, n), dvec(n)
        real(dp) :: diff
        diff = maxval(abs(reconstruct_ldlt(n, lmat, dvec) - a))
        if (diff > 1.0e-11_dp) error stop 'LDLT reconstruction mismatch'
    end subroutine verify_ldlt
end module m_ldlt_inv
