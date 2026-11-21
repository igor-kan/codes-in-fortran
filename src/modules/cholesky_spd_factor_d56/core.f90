module m_chol_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_chol_types
    use m_chol_err
    use m_chol_ifc
    implicit none
contains
subroutine cholesky_factor(a, lmat, n)
        integer, intent(in) :: n
        real(dp), intent(in) :: a(n, n)
        real(dp), intent(out) :: lmat(n, n)
        integer :: i, j, k
        real(dp) :: s
        lmat = 0.0_dp
        do i = 1, n
            do j = 1, i
                s = 0.0_dp
                do k = 1, j - 1
                    s = s + lmat(i, k) * lmat(j, k)
                end do
                if (i == j) then
                    lmat(i, j) = sqrt(a(i, i) - s)
                else
                    lmat(i, j) = (a(i, j) - s) / lmat(j, j)
                end if
            end do
        end do
    end subroutine cholesky_factor
end module m_chol_core
