module adaptive_simpson_mod
  implicit none
  private
  public :: adaptive_simpson, func_sin
contains
  real(8) function func_sin(x)
    real(8), intent(in) :: x
    func_sin = sin(x)
  end function func_sin

  recursive real(8) function simpson(f, a, b, fa, fm, fb, tol, whole) result(res)
    real(8), intent(in) :: a, b, fa, fm, fb, tol, whole
    interface
      real(8) function f(x)
        real(8), intent(in) :: x
      end function f
    end interface
    real(8) :: m, lm, rm, flm, frm, left, right, delta
    m = 0.5d0 * (a + b)
    lm = 0.5d0 * (a + m); rm = 0.5d0 * (m + b)
    flm = f(lm); frm = f(rm)
    left = (b - a) / 12.0d0 * (fa + 4.0d0 * flm + fm)
    right = (b - a) / 12.0d0 * (fm + 4.0d0 * frm + fb)
    delta = left + right - whole
    if (abs(delta) <= 15.0d0 * tol) then
      res = left + right + delta / 15.0d0
    else
      res = simpson(f, a, m, fa, flm, fm, tol / 2.0d0, left) + &
            simpson(f, m, b, fm, frm, fb, tol / 2.0d0, right)
    end if
  end function simpson

  real(8) function adaptive_simpson(f, a, b, tol) result(res)
    real(8), intent(in) :: a, b, tol
    interface
      real(8) function f(x)
        real(8), intent(in) :: x
      end function f
    end interface
    real(8) :: fa, fb, fm, m, whole
    m = 0.5d0 * (a + b)
    fa = f(a); fb = f(b); fm = f(m)
    whole = (b - a) / 6.0d0 * (fa + 4.0d0 * fm + fb)
    res = simpson(f, a, b, fa, fm, fb, tol, whole)
  end function adaptive_simpson
end module adaptive_simpson_mod
