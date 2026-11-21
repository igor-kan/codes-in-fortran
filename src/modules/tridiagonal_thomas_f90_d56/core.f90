module m_tdma_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_tdma_types
    use m_tdma_err
    use m_tdma_ifc
    implicit none
contains
subroutine solve_tridiag(a, b, c, d, x, n)
        integer, intent(in) :: n
        real(dp), intent(in) :: a(n), b(n), c(n), d(n)
        real(dp), intent(out) :: x(n)
        real(dp) :: cp(n), dp_arr(n), denom
        integer :: i
        cp(1) = c(1) / b(1)
        dp_arr(1) = d(1) / b(1)
        do i = 2, n
            denom = b(i) - a(i) * cp(i - 1)
            cp(i) = c(i) / denom
            dp_arr(i) = (d(i) - a(i) * dp_arr(i - 1)) / denom
        end do
        x(n) = dp_arr(n)
        do i = n - 1, 1, -1
            x(i) = dp_arr(i) - cp(i) * x(i + 1)
        end do
    end subroutine solve_tridiag
end module m_tdma_core
