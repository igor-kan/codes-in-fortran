module openmp_stencil_15665_mod
  implicit none
contains
  real(8) function compute_fortran_omp_15665(n_elem, dt)
    integer, intent(in) :: n_elem
    real(8), intent(in) :: dt
    real(8) :: total
    integer :: i
    total = 0.0d0
    !$omp parallel do reduction(+:total) schedule(static)
    do i = 1, n_elem
      total = total + sin(dble(i) * dt * 1.0d0) / dble(i + 3)
    end do
    !$omp end parallel do
    compute_fortran_omp_15665 = total
  end function compute_fortran_omp_15665
end module openmp_stencil_15665_mod
