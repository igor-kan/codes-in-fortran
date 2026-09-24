program test_lax_wendroff_damping_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use lax_wendroff_damping_f90_mod, only: lw_damping
    implicit none
    if (abs(lw_damping(0.4_real64) - (0.08_real64)) > 1.0e-7) stop 1
    write(*,*) "test_lax_wendroff_damping_f90 passed."
end program test_lax_wendroff_damping_f90
