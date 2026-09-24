program test_thomas_tridiag_c_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use thomas_tridiag_c_f90_mod, only: thomas_c
    implicit none
    if (abs(thomas_c(2.0_real64, 4.0_real64, 0.0_real64, 0.0_real64) - (0.5_real64)) > 1.0e-7) stop 1
    write(*,*) "test_thomas_tridiag_c_f90 passed."
end program test_thomas_tridiag_c_f90
