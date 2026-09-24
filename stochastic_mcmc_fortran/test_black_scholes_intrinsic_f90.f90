program test_black_scholes_intrinsic_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use black_scholes_intrinsic_f90_mod, only: call_intrinsic
    implicit none
    if (abs(call_intrinsic(110.0_real64, 100.0_real64) - (10.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_black_scholes_intrinsic_f90 passed."
end program test_black_scholes_intrinsic_f90
