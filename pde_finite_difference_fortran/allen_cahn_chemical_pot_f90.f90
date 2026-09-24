module allen_cahn_chemical_pot_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: ac_chem_pot
contains
    pure function ac_chem_pot(u) result(res)
        real(real64), intent(in) :: u
        real(real64) :: res
        res = u**3 - u
    end function ac_chem_pot
end module allen_cahn_chemical_pot_f90_mod
