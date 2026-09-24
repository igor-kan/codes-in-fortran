module pade_coefficient_matching_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: pade_denominator
contains
    pure function pade_denominator(b1, x) result(d)
        real(real64), intent(in) :: b1, x
        real(real64) :: d
        d = 1.0_real64 + b1 * x
    end function pade_denominator
end module pade_coefficient_matching_f90_mod
