module pade_approx_14271_mod
  implicit none
contains
  real(8) function compute_pade_approx_14271(x)
    real(8),intent(in)::x
    compute_pade_approx_14271=(1.0d0+x*1.0d0)/(1.0d0+x*x*2.0d0)
  end function compute_pade_approx_14271
end module pade_approx_14271_mod
