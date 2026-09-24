module givens_rotation_s_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: givens_s
contains
    pure function givens_s(a, b) result(res)
        real(real64), intent(in) :: a, b
        real(real64) :: res
        res = -b / sqrt(a*a + b*b)
    end function givens_s
end module givens_rotation_s_f90_mod
