module m_gmr_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure subroutine matvec_batch(n, k_rhs, a, xmat, ymat)
        integer, intent(in) :: n, k_rhs
        real(dp), intent(in) :: a(n, n), xmat(n, k_rhs)
        real(dp), intent(out) :: ymat(n, k_rhs)
        integer :: col, i, j
        real(dp) :: s
        do concurrent (col = 1:k_rhs, i = 1:n)
            s = 0.0_dp
            do j = 1, n
                s = s + a(i, j) * xmat(j, col)
            end do
            ymat(i, col) = s
        end do
    end subroutine matvec_batch
end module m_gmr_conc
