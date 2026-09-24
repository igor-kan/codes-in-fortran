program test_doolittle_pivot_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use doolittle_pivot_f90_mod, only: doolittle_mult
    implicit none
    if (abs(doolittle_mult(6.0_real64, 2.0_real64) - (3.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_doolittle_pivot_f90 passed."
end program test_doolittle_pivot_f90
