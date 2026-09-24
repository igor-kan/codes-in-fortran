program test_bicgstab_alpha_step_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use bicgstab_alpha_step_f90_mod, only: bicgstab_alpha
    implicit none
    if (abs(bicgstab_alpha(4.0_real64, 2.0_real64) - (2.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_bicgstab_alpha_step_f90 passed."
end program test_bicgstab_alpha_step_f90
