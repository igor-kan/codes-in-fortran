module power_method_rayleigh_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: rayleigh_eig
contains
    pure function rayleigh_eig(xAx, xx) result(res)
        real(real64), intent(in) :: xAx, xx
        real(real64) :: res
        res = xAx / xx
    end function rayleigh_eig
end module power_method_rayleigh_f90_mod
