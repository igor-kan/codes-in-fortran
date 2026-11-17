module m_ch_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure subroutine cheb_nodes(n, x)
        integer, intent(in) :: n
        real(dp), intent(out) :: x(0:n)
        real(dp), parameter :: pi = 3.14159265358979323846_dp
        integer :: k
        do k = 0, n
            x(k) = cos((real(k, dp) + 0.5_dp) * pi / real(n + 1, dp))
        end do
    end subroutine cheb_nodes
end module m_ch_fast
