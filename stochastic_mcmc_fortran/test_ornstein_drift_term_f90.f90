program test_ornstein_drift_term_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use ornstein_drift_term_f90_mod, only: ou_drift
    implicit none
    if (abs(ou_drift(2.0_real64, 5.0_real64, 3.0_real64) - (4.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_ornstein_drift_term_f90 passed."
end program test_ornstein_drift_term_f90
