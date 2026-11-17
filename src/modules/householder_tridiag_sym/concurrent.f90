module m_htd_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_htd_types
    use m_htd_core
    implicit none
contains
    subroutine batch_tridiag(m, n, mats, traces)
        integer, intent(in) :: m, n
        real(dp), intent(in) :: mats(n, n, m)
        real(dp), intent(out) :: traces(m)
        real(dp) :: work(n, n), d(n), e(n - 1)
        type(tridiag_rep_t) :: rep
        integer :: k
        do k = 1, m
            work = mats(:, :, k)
            call tridiag_householder(n, work, d, e, rep)
            traces(k) = sum(d)
        end do
    end subroutine batch_tridiag
end module m_htd_conc
