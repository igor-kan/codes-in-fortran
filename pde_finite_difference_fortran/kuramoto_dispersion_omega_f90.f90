module kuramoto_dispersion_omega_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: ks_dispersion
contains
    pure function ks_dispersion(k) result(res)
        real(real64), intent(in) :: k
        real(real64) :: res
        res = k**2 - k**4
    end function ks_dispersion
end module kuramoto_dispersion_omega_f90_mod
