program test_aitken_delta_squared_f90
    use aitken_delta_squared_f90_mod, only: aitken_accelerate
    implicit none
    real(real64) :: acc
    acc = aitken_accelerate(0.5, 0.75, 0.875)
    if (abs(acc - 1.0) > 1.0e-7) stop 1
    write(*,*) "test_aitken_delta_squared_f90 passed."
end program test_aitken_delta_squared_f90
