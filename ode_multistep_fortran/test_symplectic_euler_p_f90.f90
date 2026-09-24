program test_symplectic_euler_p_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use symplectic_euler_p_f90_mod, only: symp_p
    implicit none
    if (abs(symp_p(2.0_real64, 5.0_real64, 0.1_real64) - (1.5_real64)) > 1.0e-7) stop 1
    write(*,*) "test_symplectic_euler_p_f90 passed."
end program test_symplectic_euler_p_f90
