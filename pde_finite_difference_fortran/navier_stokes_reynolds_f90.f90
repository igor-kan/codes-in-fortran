module navier_stokes_reynolds_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: reynolds_num
contains
    pure function reynolds_num(u, l, nu) result(res)
        real(real64), intent(in) :: u, l, nu
        real(real64) :: res
        res = u * l / nu
    end function reynolds_num
end module navier_stokes_reynolds_f90_mod
