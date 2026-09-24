program test_poisson_source_rhs_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use poisson_source_rhs_f90_mod, only: poisson_rhs
    implicit none
    if (abs(poisson_rhs(0.1_real64, 100.0_real64) - (-1.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_poisson_source_rhs_f90 passed."
end program test_poisson_source_rhs_f90
