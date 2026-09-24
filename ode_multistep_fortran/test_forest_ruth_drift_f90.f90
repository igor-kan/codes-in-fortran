program test_forest_ruth_drift_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use forest_ruth_drift_f90_mod, only: forest_theta
    implicit none
    if (abs(forest_theta(0.5_real64) - (0.5_real64)) > 1.0e-7) stop 1
    write(*,*) "test_forest_ruth_drift_f90 passed."
end program test_forest_ruth_drift_f90
