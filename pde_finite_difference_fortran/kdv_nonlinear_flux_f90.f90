module kdv_nonlinear_flux_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: kdv_flux
contains
    pure function kdv_flux(u) result(res)
        real(real64), intent(in) :: u
        real(real64) :: res
        res = 3.0_real64 * u * u
    end function kdv_flux
end module kdv_nonlinear_flux_f90_mod
