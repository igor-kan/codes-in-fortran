module m_gqr_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    subroutine qr_least_squares(m, n, q, r, rhs, x)
        integer, intent(in) :: m, n
        real(dp), intent(in) :: q(m, m), r(m, n), rhs(m)
        real(dp), intent(out) :: x(n)
        real(dp) :: qtb(m), acc
        integer :: i, j

        qtb = matmul(transpose(q), rhs)
        do i = n, 1, -1
            acc = qtb(i)
            do j = i + 1, n
                acc = acc - r(i, j) * x(j)
            end do
            x(i) = acc / r(i, i)
        end do
    end subroutine qr_least_squares
end module m_gqr_fast
