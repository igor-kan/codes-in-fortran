module chebyshev_colloc_14237_mod
  implicit none
contains
  real(8) function compute_chebyshev_colloc_14237(x)
    real(8),intent(in)::x
    compute_chebyshev_colloc_14237=cos(3.14159265358979d0*7.0d0/8.0d0)*x
  end function compute_chebyshev_colloc_14237
end module chebyshev_colloc_14237_mod
