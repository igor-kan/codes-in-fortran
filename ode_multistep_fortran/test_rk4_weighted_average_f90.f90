program test_rk4_weighted_average_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use rk4_weighted_average_f90_mod, only: rk4_avg
    implicit none
    if (abs(rk4_avg(1.0_real64, 1.0_real64, 1.0_real64, 1.0_real64) - (1.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_rk4_weighted_average_f90 passed."
end program test_rk4_weighted_average_f90
