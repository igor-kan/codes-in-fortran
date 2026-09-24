program test_euler_forward_step_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use euler_forward_step_f90_mod, only: euler_step
    implicit none
    if (abs(euler_step(1.0_real64, 2.0_real64, 0.1_real64) - (1.2_real64)) > 1.0e-7) stop 1
    write(*,*) "test_euler_forward_step_f90 passed."
end program test_euler_forward_step_f90
