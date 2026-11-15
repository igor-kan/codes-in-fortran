module m_jcb_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    subroutine sort_eigenpairs_desc(n, evals, evecs)
        integer, intent(in) :: n
        real(dp), intent(inout) :: evals(n), evecs(n, n)
        integer :: i, j, best
        real(dp) :: tmp_v, col(n)
        do i = 1, n - 1
            best = i
            do j = i + 1, n
                if (evals(j) > evals(best)) best = j
            end do
            if (best /= i) then
                tmp_v = evals(i)
                evals(i) = evals(best)
                evals(best) = tmp_v
                col = evecs(:, i)
                evecs(:, i) = evecs(:, best)
                evecs(:, best) = col
            end if
        end do
    end subroutine sort_eigenpairs_desc
end module m_jcb_fast
