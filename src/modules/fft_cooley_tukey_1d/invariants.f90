module m_fft_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function signal_energy(n, x) result(e)
        integer, intent(in) :: n
        complex(dp), intent(in) :: x(n)
        real(dp) :: e
        integer :: i
        e = 0.0_dp
        do i = 1, n
            e = e + real(x(i), dp)**2 + aimag(x(i))**2
        end do
    end function signal_energy
end module m_fft_inv
