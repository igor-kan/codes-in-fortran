program test_kdv_nonlinear_flux_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use kdv_nonlinear_flux_f90_mod, only: kdv_flux
    implicit none
    if (abs(kdv_flux(2.0_real64) - (12.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_kdv_nonlinear_flux_f90 passed."
end program test_kdv_nonlinear_flux_f90
