program test_tanh_sinh_quadrature_f90
    use tanh_sinh_quadrature_f90_mod, only: tanh_sinh_map
    implicit none
    if (abs(tanh_sinh_map(0.0)) > 1.0e-7) stop 1
    write(*,*) "test_tanh_sinh_quadrature_f90 passed."
end program test_tanh_sinh_quadrature_f90
