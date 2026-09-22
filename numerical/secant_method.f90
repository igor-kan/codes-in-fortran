module secant_method_mod
  implicit none
  private
  public :: secant, cubic
contains
  real(8) function cubic(x)
    real(8), intent(in) :: x
    cubic = x ** 3 - 2.0d0 * x - 5.0d0
  end function cubic

  real(8) function secant(f, x0, x1, tol, maxiter) result(root)
    real(8), intent(in) :: x0, x1, tol
    integer, intent(in) :: maxiter
    interface
      real(8) function f(x)
        real(8), intent(in) :: x
      end function f
    end interface
    real(8) :: xa, xb, xc, fa, fb
    integer :: i
    xa = x0; xb = x1
    fa = f(xa); fb = f(xb)
    do i = 1, maxiter
      xc = xb - fb * (xb - xa) / (fb - fa)
      xa = xb; fa = fb
      xb = xc; fb = f(xb)
      if (abs(xb - xa) < tol) exit
    end do
    root = xb
  end function secant
end module secant_method_mod
