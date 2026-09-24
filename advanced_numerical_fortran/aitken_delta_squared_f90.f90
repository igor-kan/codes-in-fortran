module aitken_delta_squared_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: aitken_accelerate
contains
    pure function aitken_accelerate(x0, x1, x2) result(s)
        real(real64), intent(in) :: x0, x1, x2
        real(real64) :: s
        s = x2 - ((x2 - x1)**2) / (x2 - 2.0_real64 * x1 + x0)
    end function aitken_accelerate
end module aitken_delta_squared_f90_mod
