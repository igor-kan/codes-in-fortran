module laguerre_radial_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: laguerre_recurrence
contains
    pure function laguerre_recurrence(l1, l0, x, n) result(l2)
        real(real64), intent(in) :: l1, l0, x
        integer, intent(in) :: n
        real(real64) :: l2
        l2 = ((2.0_real64 * real(n, real64) + 1.0_real64 - x) * l1 - real(n, real64) * l0) / real(n + 1, real64)
    end function laguerre_recurrence
end module laguerre_radial_f90_mod
