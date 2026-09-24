module hermite_polynomial_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: hermite_recurrence
contains
    pure function hermite_recurrence(h1, h0, x, n) result(h2)
        real(real64), intent(in) :: h1, h0, x
        integer, intent(in) :: n
        real(real64) :: h2
        h2 = 2.0_real64 * x * h1 - 2.0_real64 * real(n, real64) * h0
    end function hermite_recurrence
end module hermite_polynomial_f90_mod
