program test_cholesky_diagonal_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use cholesky_diagonal_f90_mod, only: chol_diag
    implicit none
    if (abs(chol_diag(25.0_real64, 9.0_real64) - (4.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_cholesky_diagonal_f90 passed."
end program test_cholesky_diagonal_f90
