module richardson_extrapolate_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: richardson_extrap
contains
    pure function richardson_extrap(f_h, f_2h, p) result(val)
        real(real64), intent(in) :: f_h, f_2h
        integer, intent(in) :: p
        real(real64) :: val
        val = (2.0_real64**p * f_h - f_2h) / (2.0_real64**p - 1.0_real64)
    end function richardson_extrap
end module richardson_extrapolate_f90_mod
