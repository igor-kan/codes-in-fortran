module dormand_prince_error_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: dp_error
contains
    pure function dp_error(y5, y4) result(res)
        real(real64), intent(in) :: y5, y4
        real(real64) :: res
        res = abs(y5 - y4)
    end function dp_error
end module dormand_prince_error_f90_mod
