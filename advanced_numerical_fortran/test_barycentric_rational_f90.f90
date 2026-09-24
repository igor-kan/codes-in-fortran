program test_barycentric_rational_f90
    use barycentric_rational_f90_mod, only: bary_weight
    implicit none
    if (bary_weight(2) /= 1.0) stop 1
    write(*,*) "test_barycentric_rational_f90 passed."
end program test_barycentric_rational_f90
