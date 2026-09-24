program test_kuramoto_dispersion_omega_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use kuramoto_dispersion_omega_f90_mod, only: ks_dispersion
    implicit none
    if (abs(ks_dispersion(0.5_real64) - (0.1875_real64)) > 1.0e-7) stop 1
    write(*,*) "test_kuramoto_dispersion_omega_f90 passed."
end program test_kuramoto_dispersion_omega_f90
