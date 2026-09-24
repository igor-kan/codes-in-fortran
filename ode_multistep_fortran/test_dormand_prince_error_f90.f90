program test_dormand_prince_error_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use dormand_prince_error_f90_mod, only: dp_error
    implicit none
    if (abs(dp_error(1.002_real64, 1.000_real64) - (0.002_real64)) > 1.0e-7) stop 1
    write(*,*) "test_dormand_prince_error_f90 passed."
end program test_dormand_prince_error_f90
