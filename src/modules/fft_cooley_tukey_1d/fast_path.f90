module m_fft_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure subroutine power_spectrum(n, spec, pwr)
        integer, intent(in) :: n
        complex(dp), intent(in) :: spec(n)
        real(dp), intent(out) :: pwr(n)
        integer :: i
        do i = 1, n
            pwr(i) = real(spec(i), dp)**2 + aimag(spec(i))**2
        end do
    end subroutine power_spectrum
end module m_fft_fast
