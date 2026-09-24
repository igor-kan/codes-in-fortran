program test_laplace_2d_five_point_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use laplace_2d_five_point_f90_mod, only: five_point_mid
    implicit none
    if (abs(five_point_mid(1.0_real64, 2.0_real64, 3.0_real64, 4.0_real64) - (2.5_real64)) > 1.0e-7) stop 1
    write(*,*) "test_laplace_2d_five_point_f90 passed."
end program test_laplace_2d_five_point_f90
