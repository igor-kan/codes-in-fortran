program test_wave_1d_cfl_number_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use wave_1d_cfl_number_f90_mod, only: cfl_number
    implicit none
    if (abs(cfl_number(300.0_real64, 0.001_real64, 0.5_real64) - (0.6_real64)) > 1.0e-7) stop 1
    write(*,*) "test_wave_1d_cfl_number_f90 passed."
end program test_wave_1d_cfl_number_f90
