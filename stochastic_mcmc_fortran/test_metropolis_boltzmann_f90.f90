program test_metropolis_boltzmann_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use metropolis_boltzmann_f90_mod, only: boltzmann_prob
    implicit none
    if (abs(boltzmann_prob(0.0_real64, 1.0_real64) - (1.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_metropolis_boltzmann_f90 passed."
end program test_metropolis_boltzmann_f90
