! Core computational routines for Gauss-Legendre Quadrature Weights and Integration
! Module: quadrature_gauss_legendre

module quadrature_gauss_legendre_core
  use quadrature_gauss_legendre_types
  use, intrinsic :: iso_c_binding
  implicit none
  private

  public :: quadrature_gauss_legendre_compute

contains

  subroutine quadrature_gauss_legendre_compute(ctx, in_vec, out_vec, n, status)
    type(quadrature_gauss_legendre_context_t), intent(inout) :: ctx
    real(c_double), intent(in)            :: in_vec(:)
    real(c_double), intent(out)           :: out_vec(:)
    integer, intent(in)                   :: n
    integer, intent(out)                  :: status
    integer                               :: i
    real(c_double)                        :: x

    if (n <= 0 .or. size(in_vec) < n .or. size(out_vec) < n) then
       status = ERR_INVALID_PARAM
       return
    end if

    do i = 1, n
       x = in_vec(i)
       out_vec(i) = x * (1.0d0 + 0.5d0 * x - 0.125d0 * x * x)
    end do

    ctx%operations_count = ctx%operations_count + int(n, c_int64_t)
    status = SUCCESS
  end subroutine quadrature_gauss_legendre_compute

end module quadrature_gauss_legendre_core
