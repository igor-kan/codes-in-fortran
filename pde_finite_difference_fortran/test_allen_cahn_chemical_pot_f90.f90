program test_allen_cahn_chemical_pot_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use allen_cahn_chemical_pot_f90_mod, only: ac_chem_pot
    implicit none
    if (abs(ac_chem_pot(2.0_real64) - (6.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_allen_cahn_chemical_pot_f90 passed."
end program test_allen_cahn_chemical_pot_f90
