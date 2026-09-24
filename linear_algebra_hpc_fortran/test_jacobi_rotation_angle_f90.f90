program test_jacobi_rotation_angle_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use jacobi_rotation_angle_f90_mod, only: jacobi_angle
    implicit none
    if (abs(jacobi_angle(1.0_real64, 1.0_real64, 1.0_real64) - (0.7853981633974483_real64)) > 1.0e-7) stop 1
    write(*,*) "test_jacobi_rotation_angle_f90 passed."
end program test_jacobi_rotation_angle_f90
