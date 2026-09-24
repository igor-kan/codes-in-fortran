program test_leapfrog_verlet_pos_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use leapfrog_verlet_pos_f90_mod, only: verlet_pos
    implicit none
    if (abs(verlet_pos(0.0_real64, 5.0_real64, 0.2_real64) - (1.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_leapfrog_verlet_pos_f90 passed."
end program test_leapfrog_verlet_pos_f90
