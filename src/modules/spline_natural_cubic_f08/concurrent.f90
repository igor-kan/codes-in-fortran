module m_spl_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_spl_core
    implicit none
contains
    pure subroutine batch_eval_spline(n, x, y, b, c, d, m, xq, yq)
        integer, intent(in) :: n, m
        real(dp), intent(in) :: x(n), y(n), b(n), c(n), d(n), xq(m)
        real(dp), intent(out) :: yq(m)
        integer :: j
        do concurrent (j = 1:m)
            yq(j) = eval_natural_spline(n, x, y, b, c, d, xq(j))
        end do
    end subroutine batch_eval_spline
end module m_spl_conc
