module pade_approx_14226_mod
  implicit none
contains
  real(8) function compute_pade_approx_14226(x)
    real(8),intent(in)::x
    compute_pade_approx_14226=(1.0d0+x*1.0d0)/(1.0d0+x*x*1.0d0)
  end function compute_pade_approx_14226
end module pade_approx_14226_mod
