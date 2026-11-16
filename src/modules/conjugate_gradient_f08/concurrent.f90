module m_cgf_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure subroutine batch_res_norms(n, k, a, xmat, bmat, norms)
        integer, intent(in) :: n, k
        real(dp), intent(in) :: a(n, n), xmat(n, k), bmat(n, k)
        real(dp), intent(out) :: norms(k)
        integer :: col, i, j
        real(dp) :: acc, r
        do concurrent (col = 1:k)
            r = 0.0_dp
            do i = 1, n
                acc = -bmat(i, col)
                do j = 1, n
                    acc = acc + a(i, j) * xmat(j, col)
                end do
                r = r + acc * acc
            end do
            norms(col) = sqrt(r)
        end do
    end subroutine batch_res_norms
end module m_cgf_conc
