module hypergeom_series_7_mod
  implicit none
contains
  real(8) function compute_hypergeom_series_7(x)
    real(8), intent(in) :: x
    compute_hypergeom_series_7 = (x ** 3) / 2.0d0
  end function
end module

program test_hypergeom_series_7
  use hypergeom_series_7_mod
  implicit none
  real(8) :: res
  res = compute_hypergeom_series_7(0.5d0)
  if (res /= res) stop 1
end program
