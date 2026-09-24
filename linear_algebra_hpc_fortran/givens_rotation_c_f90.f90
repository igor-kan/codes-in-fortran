module givens_rotation_c_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: givens_c
contains
    pure function givens_c(a, b) result(res)
        real(real64), intent(in) :: a, b
        real(real64) :: res
        res = a / sqrt(a*a + b*b)
    end function givens_c
end module givens_rotation_c_f90_mod
