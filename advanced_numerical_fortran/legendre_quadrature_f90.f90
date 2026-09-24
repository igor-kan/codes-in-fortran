module legendre_quadrature_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: legendre_recurrence
contains
    pure function legendre_recurrence(p1, p0, x, n) result(p2)
        real(real64), intent(in) :: p1, p0, x
        integer, intent(in) :: n
        real(real64) :: p2
        p2 = ((2.0_real64 * real(n, real64) + 1.0_real64) * x * p1 - real(n, real64) * p0) / real(n + 1, real64)
    end function legendre_recurrence
end module legendre_quadrature_f90_mod
