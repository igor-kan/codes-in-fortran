module spherical_harm_8059_mod
  implicit none
contains
  real(8) function compute_spherical_harm_8059(x)
    real(8),intent(in)::x
    compute_spherical_harm_8059=(x**5)/10.0d0
  end function
end module
program test_spherical_harm_8059
  use spherical_harm_8059_mod
  implicit none
  real(8)::res
  res=compute_spherical_harm_8059(0.5d0)
  if(res/=res) stop 1
end program
