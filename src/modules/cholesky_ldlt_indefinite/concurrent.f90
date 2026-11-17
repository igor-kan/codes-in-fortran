module m_ldlt_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ldlt_core
    implicit none
contains
    subroutine multi_rhs_solve(n, lmat, dvec, m, bmat, xmat)
        integer, intent(in) :: n, m
        real(dp), intent(in) :: lmat(n, n), dvec(n), bmat(n, m)
        real(dp), intent(out) :: xmat(n, m)
        integer :: j
        do j = 1, m
            call ldlt_solve(n, lmat, dvec, bmat(:, j), xmat(:, j))
        end do
    end subroutine multi_rhs_solve
end module m_ldlt_conc
