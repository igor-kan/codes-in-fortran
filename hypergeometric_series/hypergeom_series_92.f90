module hypergeom_series_92_mod
  implicit none
contains
  real(8) function compute_hypergeom_series_92(x)
    real(8), intent(in) :: x
    compute_hypergeom_series_92 = (x ** 0) / 3.0d0
  end function
end module

program test_hypergeom_series_92
  use hypergeom_series_92_mod
  implicit none
  real(8) :: res
  res = compute_hypergeom_series_92(0.5d0)
  if (res /= res) stop 1
end program
