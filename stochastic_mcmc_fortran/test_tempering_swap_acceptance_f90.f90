program test_tempering_swap_acceptance_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use tempering_swap_acceptance_f90_mod, only: swap_accept
    implicit none
    if (abs(swap_accept(0.0_real64, 10.0_real64) - (1.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_tempering_swap_acceptance_f90 passed."
end program test_tempering_swap_acceptance_f90
