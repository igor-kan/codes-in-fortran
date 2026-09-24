module yoshida_4th_symplectic_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: yoshida_w1
contains
    pure function yoshida_w1(n) result(res)
        integer, intent(in) :: n
        real(real64) :: res
        res = 1.0_real64 / (2.0_real64 - 2.0_real64**(1.0_real64/3.0_real64))
    end function yoshida_w1
end module yoshida_4th_symplectic_f90_mod
