program test_givens_rotation_s_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use givens_rotation_s_f90_mod, only: givens_s
    implicit none
    if (abs(givens_s(3.0_real64, 4.0_real64) - (-0.8_real64)) > 1.0e-7) stop 1
    write(*,*) "test_givens_rotation_s_f90 passed."
end program test_givens_rotation_s_f90
