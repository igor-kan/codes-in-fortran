program test_fokker_planck_drift_flux_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use fokker_planck_drift_flux_f90_mod, only: fp_drift_flux
    implicit none
    if (abs(fp_drift_flux(2.0_real64, 3.0_real64) - (6.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_fokker_planck_drift_flux_f90 passed."
end program test_fokker_planck_drift_flux_f90
