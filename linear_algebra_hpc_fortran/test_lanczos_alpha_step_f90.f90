program test_lanczos_alpha_step_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use lanczos_alpha_step_f90_mod, only: lanczos_alpha
    implicit none
    if (abs(lanczos_alpha(10.0_real64, 2.0_real64) - (5.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_lanczos_alpha_step_f90 passed."
end program test_lanczos_alpha_step_f90
