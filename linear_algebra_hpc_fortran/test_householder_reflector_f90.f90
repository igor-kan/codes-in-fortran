program test_householder_reflector_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use householder_reflector_f90_mod, only: householder_scalar
    implicit none
    if (abs(householder_scalar(3.0_real64, 5.0_real64) - (8.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_householder_reflector_f90 passed."
end program test_householder_reflector_f90
