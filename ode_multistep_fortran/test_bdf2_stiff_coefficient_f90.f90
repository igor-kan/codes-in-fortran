program test_bdf2_stiff_coefficient_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use bdf2_stiff_coefficient_f90_mod, only: bdf2_y
    implicit none
    if (abs(bdf2_y(1.0_real64, 1.0_real64) - (1.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_bdf2_stiff_coefficient_f90 passed."
end program test_bdf2_stiff_coefficient_f90
