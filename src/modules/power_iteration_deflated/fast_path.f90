module m_pwr_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function max_eigenpair_residual(n, k, a, evals, evecs) result(err)
        integer, intent(in) :: n, k
        real(dp), intent(in) :: a(n, n), evals(k), evecs(n, k)
        real(dp) :: err, r(n)
        integer :: j
        err = 0.0_dp
        do j = 1, k
            r = matmul(a, evecs(:, j)) - evals(j) * evecs(:, j)
            err = max(err, sqrt(sum(r * r)))
        end do
    end function max_eigenpair_residual
end module m_pwr_fast
