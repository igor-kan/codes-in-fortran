module chebyshev_colloc_14467_mod
  implicit none
contains
  real(8) function compute_chebyshev_colloc_14467(x)
    real(8),intent(in)::x
    compute_chebyshev_colloc_14467=cos(3.14159265358979d0*7.0d0/8.0d0)*x
  end function compute_chebyshev_colloc_14467
end module chebyshev_colloc_14467_mod
