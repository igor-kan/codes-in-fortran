module fokker_planck_drift_flux_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: fp_drift_flux
contains
    pure function fp_drift_flux(v, p) result(res)
        real(real64), intent(in) :: v, p
        real(real64) :: res
        res = v * p
    end function fp_drift_flux
end module fokker_planck_drift_flux_f90_mod
