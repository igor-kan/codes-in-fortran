program test_gillespie_hazard_sum_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use gillespie_hazard_sum_f90_mod, only: total_hazard
    implicit none
    if (abs(total_hazard(3.0_real64, 7.0_real64) - (10.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_gillespie_hazard_sum_f90 passed."
end program test_gillespie_hazard_sum_f90
