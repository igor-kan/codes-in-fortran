module m_pwr_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure subroutine batch_rayleigh_evals(n, k, a, vecs, lams)
        integer, intent(in) :: n, k
        real(dp), intent(in) :: a(n, n), vecs(n, k)
        real(dp), intent(out) :: lams(k)
        integer :: m, i, j
        real(dp) :: num, row_s
        do concurrent (m = 1:k)
            num = 0.0_dp
            do i = 1, n
                row_s = 0.0_dp
                do j = 1, n
                    row_s = row_s + a(i, j) * vecs(j, m)
                end do
                num = num + vecs(i, m) * row_s
            end do
            lams(m) = num
        end do
    end subroutine batch_rayleigh_evals
end module m_pwr_conc
