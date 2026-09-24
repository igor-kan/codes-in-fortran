program test_helmholtz_wavenumber_sq_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use helmholtz_wavenumber_sq_f90_mod, only: helmholtz_k2
    implicit none
    if (abs(helmholtz_k2(3.0_real64) - (9.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_helmholtz_wavenumber_sq_f90 passed."
end program test_helmholtz_wavenumber_sq_f90
