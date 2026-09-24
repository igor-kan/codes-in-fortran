program test_matrix_frobenius_norm_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use matrix_frobenius_norm_f90_mod, only: frobenius_term
    implicit none
    if (abs(frobenius_term(16.0_real64) - (4.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_matrix_frobenius_norm_f90 passed."
end program test_matrix_frobenius_norm_f90
