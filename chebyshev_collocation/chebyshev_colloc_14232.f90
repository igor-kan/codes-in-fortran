module chebyshev_colloc_14232_mod
  implicit none
contains
  real(8) function compute_chebyshev_colloc_14232(x)
    real(8),intent(in)::x
    compute_chebyshev_colloc_14232=cos(3.14159265358979d0*2.0d0/3.0d0)*x
  end function compute_chebyshev_colloc_14232
end module chebyshev_colloc_14232_mod
