program test_radau_implicit_colloc_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use radau_implicit_colloc_f90_mod, only: radau_weight
    implicit none
    if (abs(radau_weight(0.4_real64) - (0.4_real64)) > 1.0e-7) stop 1
    write(*,*) "test_radau_implicit_colloc_f90 passed."
end program test_radau_implicit_colloc_f90
