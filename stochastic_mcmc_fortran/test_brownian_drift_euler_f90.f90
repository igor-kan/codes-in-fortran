program test_brownian_drift_euler_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use brownian_drift_euler_f90_mod, only: brownian_step
    implicit none
    if (abs(brownian_step(10.0_real64, 2.0_real64, 0.5_real64) - (11.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_brownian_drift_euler_f90 passed."
end program test_brownian_drift_euler_f90
