module fourier_chebyshev_fast_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: cheb_fourier_angle
contains
    pure function cheb_fourier_angle(theta, k) result(v)
        real(real64), intent(in) :: theta
        integer, intent(in) :: k
        real(real64) :: v
        v = cos(real(k, real64) * theta)
    end function cheb_fourier_angle
end module fourier_chebyshev_fast_f90_mod
