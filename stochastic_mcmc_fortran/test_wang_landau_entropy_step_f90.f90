program test_wang_landau_entropy_step_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use wang_landau_entropy_step_f90_mod, only: wl_entropy
    implicit none
    if (abs(wl_entropy(5.0_real64, 1.0_real64) - (6.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_wang_landau_entropy_step_f90 passed."
end program test_wang_landau_entropy_step_f90
