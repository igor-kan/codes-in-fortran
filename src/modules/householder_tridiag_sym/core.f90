module m_htd_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_htd_types
    use m_htd_err
    implicit none
contains
    subroutine tridiag_householder(n, a, d, e, rep)
        integer, intent(in) :: n
        real(dp), intent(inout) :: a(n, n)
        real(dp), intent(out) :: d(n), e(n - 1)
        type(tridiag_rep_t), intent(out) :: rep
        real(dp) :: u(n), p(n), q(n), ssq, sigma, beta, kfac, tr_in, tr_out
        integer :: k, i, j

        rep%status = ERR_OK
        tr_in = 0.0_dp
        do i = 1, n
            tr_in = tr_in + a(i, i)
        end do
        e = 0.0_dp
        do k = 1, n - 2
            ssq = sum(a(k + 1:n, k)**2)
            if (ssq < 1.0e-30_dp) then
                e(k) = 0.0_dp
                cycle
            end if
            sigma = sqrt(ssq)
            if (a(k + 1, k) >= 0.0_dp) sigma = -sigma
            u = 0.0_dp
            u(k + 1:n) = a(k + 1:n, k)
            u(k + 1) = u(k + 1) - sigma
            beta = 2.0_dp / dot_product(u(k + 1:n), u(k + 1:n))
            p = 0.0_dp
            p(k + 1:n) = beta * matmul(a(k + 1:n, k + 1:n), u(k + 1:n))
            kfac = 0.5_dp * beta * dot_product(p(k + 1:n), u(k + 1:n))
            q = 0.0_dp
            q(k + 1:n) = p(k + 1:n) - kfac * u(k + 1:n)
            do j = k + 1, n
                do i = k + 1, n
                    a(i, j) = a(i, j) - u(i) * q(j) - q(i) * u(j)
                end do
            end do
            a(k + 1, k) = sigma
            a(k, k + 1) = sigma
            e(k) = sigma
            a(k + 2:n, k) = 0.0_dp
            a(k, k + 2:n) = 0.0_dp
        end do
        if (n >= 2) e(n - 1) = a(n, n - 1)
        tr_out = 0.0_dp
        do i = 1, n
            d(i) = a(i, i)
            tr_out = tr_out + d(i)
        end do
        rep%trace_diff = abs(tr_in - tr_out)
    end subroutine tridiag_householder
end module m_htd_core
