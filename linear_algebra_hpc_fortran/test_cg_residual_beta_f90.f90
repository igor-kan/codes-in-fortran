program test_cg_residual_beta_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use cg_residual_beta_f90_mod, only: cg_beta_step
    implicit none
    if (abs(cg_beta_step(0.5_real64, 2.0_real64) - (0.25_real64)) > 1.0e-7) stop 1
    write(*,*) "test_cg_residual_beta_f90 passed."
end program test_cg_residual_beta_f90
