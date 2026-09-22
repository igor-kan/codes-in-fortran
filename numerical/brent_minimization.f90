module brent_minimization_mod
  implicit none
  private
  public :: brent_minimize, parabola
contains
  real(8) function parabola(x)
    real(8), intent(in) :: x
    parabola = (x - 3.0d0) ** 2 + 1.0d0
  end function parabola

  real(8) function brent_minimize(f, a_in, b_in, tol) result(xm)
    real(8), intent(in) :: a_in, b_in, tol
    interface
      real(8) function f(x)
        real(8), intent(in) :: x
      end function f
    end interface
    real(8) :: a, b, gold, x, w, v, fx, fw, fv, d, e, u, fu, etemp
    real(8) :: tol1, tol2, r, p, q, xm_mid
    integer :: iter
    a = a_in
    b = b_in
    gold = 0.3819660112501051d0
    x = a + gold * (b - a); w = x; v = x
    fx = f(x); fw = fx; fv = fx
    d = 0.0d0; e = 0.0d0
    do iter = 1, 200
      xm_mid = 0.5d0 * (a + b)
      tol1 = tol * abs(x) + 1.0d-12
      tol2 = 2.0d0 * tol1
      if (abs(x - xm_mid) <= tol2 - 0.5d0 * (b - a)) exit
      if (abs(e) > tol1) then
        r = (x - w) * (fx - fv)
        q = (x - v) * (fx - fw)
        p = (x - v) * q - (x - w) * r
        q = 2.0d0 * (q - r)
        if (q > 0.0d0) p = -p
        q = abs(q)
        etemp = e
        e = d
        if (abs(p) >= abs(0.5d0 * q * etemp) .or. p <= q * (a - x) .or. p >= q * (b - x)) then
          e = merge(a - x, b - x, x >= xm_mid)
          d = gold * e
        else
          d = p / q
          u = x + d
          if (u - a < tol2 .or. b - u < tol2) d = sign(tol1, xm_mid - x)
        end if
      else
        e = merge(a - x, b - x, x >= xm_mid)
        d = gold * e
      end if
      if (abs(d) >= tol1) then
        u = x + d
      else
        u = x + sign(tol1, d)
      end if
      fu = f(u)
      if (fu <= fx) then
        if (u >= x) then
          a = x
        else
          b = x
        end if
        v = w; fv = fw; w = x; fw = fx; x = u; fx = fu
      else
        if (u < x) then
          a = u
        else
          b = u
        end if
        if (fu <= fw .or. w == x) then
          v = w; fv = fw; w = u; fw = fu
        else if (fu <= fv .or. v == x .or. v == w) then
          v = u; fv = fu
        end if
      end if
    end do
    xm = x
  end function brent_minimize
end module brent_minimization_mod
