module jacobi_iteration_mod
  implicit none
  private
  public :: jacobi_solve
contains
  subroutine jacobi_solve(a, b, x, n, tol, maxiter, iters)
    integer, intent(in) :: n, maxiter
    real(8), intent(in) :: a(n, n), b(n), tol
    real(8), intent(inout) :: x(n)
    integer, intent(out) :: iters
    real(8) :: xnew(n), s, err
    integer :: i, j, k
    do k = 1, maxiter
      err = 0.0d0
      do i = 1, n
        s = 0.0d0
        do j = 1, n
          if (j /= i) s = s + a(i, j) * x(j)
        end do
        xnew(i) = (b(i) - s) / a(i, i)
        err = max(err, abs(xnew(i) - x(i)))
      end do
      x = xnew
      if (err < tol) exit
    end do
    iters = k
  end subroutine jacobi_solve
end module jacobi_iteration_mod
