module advection_1d_upwind_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: upwind_flux
contains
    pure function upwind_flux(u_curr, u_prev, cfl) result(res)
        real(real64), intent(in) :: u_curr, u_prev, cfl
        real(real64) :: res
        res = u_curr - cfl * (u_curr - u_prev)
    end function upwind_flux
end module advection_1d_upwind_f90_mod
