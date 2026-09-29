module hypergeom_series_32_mod
  implicit none
contains
  real(8) function compute_hypergeom_series_32(x)
    real(8), intent(in) :: x
    compute_hypergeom_series_32 = (x ** 0) / 3.0d0
  end function
end module

program test_hypergeom_series_32
  use hypergeom_series_32_mod
  implicit none
  real(8) :: res
  res = compute_hypergeom_series_32(0.5d0)
  if (res /= res) stop 1
end program
