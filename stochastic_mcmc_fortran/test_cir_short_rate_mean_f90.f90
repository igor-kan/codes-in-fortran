program test_cir_short_rate_mean_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use cir_short_rate_mean_f90_mod, only: cir_mean_rate
    implicit none
    if (abs(cir_mean_rate(0.05_real64) - (0.05_real64)) > 1.0e-7) stop 1
    write(*,*) "test_cir_short_rate_mean_f90 passed."
end program test_cir_short_rate_mean_f90
