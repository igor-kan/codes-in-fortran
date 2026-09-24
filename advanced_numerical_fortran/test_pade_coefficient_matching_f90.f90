program test_pade_coefficient_matching_f90
    use pade_coefficient_matching_f90_mod, only: pade_denominator
    implicit none
    if (pade_denominator(0.5, 2.0) /= 2.0) stop 1
    write(*,*) "test_pade_coefficient_matching_f90 passed."
end program test_pade_coefficient_matching_f90
