program test_box_muller_radius_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use box_muller_radius_f90_mod, only: box_muller_r
    implicit none
    if (abs(box_muller_r(exp(-0.5_real64)) - (1.0_real64)) > 1.0e-7) stop 1
    write(*,*) "test_box_muller_radius_f90 passed."
end program test_box_muller_radius_f90
