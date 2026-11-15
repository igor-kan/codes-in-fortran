module m_gmr_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure subroutine scale_jacobi_system(n, a, b, inv_d)
        integer, intent(in) :: n
        real(dp), intent(inout) :: a(n, n), b(n)
        real(dp), intent(out) :: inv_d(n)
        integer :: i
        do i = 1, n
            inv_d(i) = merge(1.0_dp / a(i, i), 1.0_dp, abs(a(i, i)) > 1.0e-14_dp)
            a(i, :) = a(i, :) * inv_d(i)
            b(i) = b(i) * inv_d(i)
        end do
    end subroutine scale_jacobi_system
end module m_gmr_fast
