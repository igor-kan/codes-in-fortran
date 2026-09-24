program test_power_method_rayleigh_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use power_method_rayleigh_f90_mod, only: rayleigh_eig
    implicit none
    if (abs(rayleigh_eig(15.0_real64, 3.0_real64) - (5.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_power_method_rayleigh_f90 passed."
end program test_power_method_rayleigh_f90
