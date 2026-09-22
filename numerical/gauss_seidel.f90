module gauss_seidel_mod
  implicit none
  private
  public :: gauss_seidel
contains
  subroutine gauss_seidel(a, b, x, n, tol, maxiter, iters)
    integer, intent(in) :: n, maxiter
    real(8), intent(in) :: a(n, n), b(n), tol
    real(8), intent(inout) :: x(n)
    integer, intent(out) :: iters
    integer :: i, j, k
    real(8) :: s, xold, err
    do k = 1, maxiter
      err = 0.0d0
      do i = 1, n
        s = 0.0d0
        do j = 1, n
          if (j /= i) s = s + a(i, j) * x(j)
        end do
        xold = x(i)
        x(i) = (b(i) - s) / a(i, i)
        err = max(err, abs(x(i) - xold))
      end do
      if (err < tol) exit
    end do
    iters = k
  end subroutine gauss_seidel
end module gauss_seidel_mod
