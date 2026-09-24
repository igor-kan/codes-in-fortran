program test_effective_sample_size_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use effective_sample_size_f90_mod, only: ess_stat
    implicit none
    if (abs(ess_stat(0.1_real64) - (10.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_effective_sample_size_f90 passed."
end program test_effective_sample_size_f90
