program test_givens_rotation_c_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use givens_rotation_c_f90_mod, only: givens_c
    implicit none
    if (abs(givens_c(3.0_real64, 4.0_real64) - (0.6_real64)) > 1.0e-7) stop 1
    write(*,*) "test_givens_rotation_c_f90 passed."
end program test_givens_rotation_c_f90
