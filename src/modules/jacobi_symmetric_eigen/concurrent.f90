module m_jcb_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure subroutine batch_rayleigh_quotients(n, m, a, vecs, rq)
        integer, intent(in) :: n, m
        real(dp), intent(in) :: a(n, n), vecs(n, m)
        real(dp), intent(out) :: rq(m)
        integer :: k, i, j
        real(dp) :: num, den, av_i
        do concurrent (k = 1:m)
            num = 0.0_dp
            den = 0.0_dp
            do i = 1, n
                av_i = 0.0_dp
                do j = 1, n
                    av_i = av_i + a(i, j) * vecs(j, k)
                end do
                num = num + vecs(i, k) * av_i
                den = den + vecs(i, k) * vecs(i, k)
            end do
            if (den > 0.0_dp) then
                rq(k) = num / den
            else
                rq(k) = 0.0_dp
            end if
        end do
    end subroutine batch_rayleigh_quotients
end module m_jcb_conc
