module m_pwr_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_pwr_fast
    implicit none
contains
    function check_deflation_orthogonality(n, k, a, evals, evecs, tol) result(ok)
        integer, intent(in) :: n, k
        real(dp), intent(in) :: a(n, n), evals(k), evecs(n, k), tol
        logical :: ok
        real(dp) :: q(k, k)
        integer :: i, j
        ok = (max_eigenpair_residual(n, k, a, evals, evecs) <= tol)
        q = matmul(transpose(evecs), evecs)
        do i = 1, k
            do j = 1, k
                if (i == j) then
                    if (abs(q(i, j) - 1.0_dp) > tol) ok = .false.
                else
                    if (abs(q(i, j)) > tol) ok = .false.
                end if
            end do
        end do
    end function check_deflation_orthogonality
end module m_pwr_inv
