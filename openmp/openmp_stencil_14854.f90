module openmp_stencil_14854_mod
  implicit none
contains
  real(8) function compute_fortran_omp_14854(n_elem, dt)
    integer, intent(in) :: n_elem
    real(8), intent(in) :: dt
    real(8) :: total
    integer :: i
    total = 0.0d0
    !$omp parallel do reduction(+:total) schedule(static)
    do i = 1, n_elem
      total = total + sin(dble(i) * dt * 5.0d0) / dble(i + 2)
    end do
    !$omp end parallel do
    compute_fortran_omp_14854 = total
  end function compute_fortran_omp_14854
end module openmp_stencil_14854_mod
