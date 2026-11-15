module m_jcb_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_jcb_types
    use m_jcb_err
    implicit none
contains
    subroutine jacobi_eigen_solve(n, a_in, evals, evecs, cfg, rep)
        integer, intent(in) :: n
        real(dp), intent(in) :: a_in(n, n)
        real(dp), intent(out) :: evals(n), evecs(n, n)
        type(eigen_config_t), intent(in) :: cfg
        type(eigen_report_t), intent(out) :: rep
        real(dp) :: a(n, n)
        real(dp) :: off2, g, h, t, theta, c, s, tau, apq, tmp1, tmp2
        integer :: i, j, p, q, sweep

        rep%sweeps = 0
        rep%status = ERR_OK
        rep%off_diag_norm = 0.0_dp
        a = 0.5_dp * (a_in + transpose(a_in))
        evecs = 0.0_dp
        do i = 1, n
            evecs(i, i) = 1.0_dp
            evals(i) = a(i, i)
        end do

        do sweep = 1, cfg%max_sweeps
            off2 = 0.0_dp
            do q = 2, n
                do p = 1, q - 1
                    off2 = off2 + a(p, q) * a(p, q)
                end do
            end do
            rep%off_diag_norm = sqrt(2.0_dp * off2)
            if (rep%off_diag_norm <= cfg%tol) then
                rep%sweeps = sweep - 1
                do i = 1, n
                    evals(i) = a(i, i)
                end do
                return
            end if

            do p = 1, n - 1
                do q = p + 1, n
                    apq = a(p, q)
                    g = 100.0_dp * abs(apq)
                    if (abs(apq) <= cfg%tol * 1.0e-3_dp) cycle
                    h = a(q, q) - a(p, p)
                    if (abs(h) + g == abs(h)) then
                        t = apq / h
                    else
                        theta = 0.5_dp * h / apq
                        t = 1.0_dp / (abs(theta) + sqrt(1.0_dp + theta * theta))
                        if (theta < 0.0_dp) t = -t
                    end if
                    c = 1.0_dp / sqrt(1.0_dp + t * t)
                    s = t * c
                    tau = s / (1.0_dp + c)
                    a(p, p) = a(p, p) - t * apq
                    a(q, q) = a(q, q) + t * apq
                    a(p, q) = 0.0_dp
                    a(q, p) = 0.0_dp
                    do j = 1, n
                        if (j /= p .and. j /= q) then
                            tmp1 = a(p, j)
                            tmp2 = a(q, j)
                            a(p, j) = tmp1 - s * (tmp2 + tau * tmp1)
                            a(j, p) = a(p, j)
                            a(q, j) = tmp2 + s * (tmp1 - tau * tmp2)
                            a(j, q) = a(q, j)
                        end if
                        tmp1 = evecs(j, p)
                        tmp2 = evecs(j, q)
                        evecs(j, p) = tmp1 - s * (tmp2 + tau * tmp1)
                        evecs(j, q) = tmp2 + s * (tmp1 - tau * tmp2)
                    end do
                end do
            end do
            rep%sweeps = sweep
        end do

        do i = 1, n
            evals(i) = a(i, i)
        end do
        if (rep%off_diag_norm > cfg%tol) rep%status = ERR_NO_CONV
    end subroutine jacobi_eigen_solve
end module m_jcb_core
