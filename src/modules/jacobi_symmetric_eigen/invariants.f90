module m_jcb_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    function eigen_residual(n, a, evals, evecs) result(err)
        integer, intent(in) :: n
        real(dp), intent(in) :: a(n, n), evals(n), evecs(n, n)
        real(dp) :: err, av(n, n), vd(n, n)
        integer :: j
        av = matmul(a, evecs)
        do j = 1, n
            vd(:, j) = evecs(:, j) * evals(j)
        end do
        err = sqrt(sum((av - vd) ** 2))
    end function eigen_residual

    function orthogonality_error(n, v) result(err)
        integer, intent(in) :: n
        real(dp), intent(in) :: v(n, n)
        real(dp) :: err, vtv(n, n)
        integer :: i
        vtv = matmul(transpose(v), v)
        do i = 1, n
            vtv(i, i) = vtv(i, i) - 1.0_dp
        end do
        err = sqrt(sum(vtv ** 2))
    end function orthogonality_error
end module m_jcb_inv
