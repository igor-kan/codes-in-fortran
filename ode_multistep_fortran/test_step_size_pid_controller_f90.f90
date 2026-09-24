program test_step_size_pid_controller_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use step_size_pid_controller_f90_mod, only: pid_h_factor
    implicit none
    if (abs(pid_h_factor(1.0_real64, 1.0_real64) - (1.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_step_size_pid_controller_f90 passed."
end program test_step_size_pid_controller_f90
