module m_ldlt_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    function reconstruct_ldlt(n, lmat, dvec) result(mat)
        integer, intent(in) :: n
        real(dp), intent(in) :: lmat(n, n), dvec(n)
        real(dp) :: mat(n, n), ld(n, n)
        integer :: j
        do j = 1, n
            ld(:, j) = lmat(:, j) * dvec(j)
        end do
        mat = matmul(ld, transpose(lmat))
    end function reconstruct_ldlt
end module m_ldlt_fast
