module m_gmr_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gmr_types
    use m_gmr_err
    implicit none
contains
    subroutine gmres_solve(n, a, b, cfg, x, rep)
        integer, intent(in) :: n
        real(dp), intent(in) :: a(n, n), b(n)
        type(gmres_config_t), intent(in) :: cfg
        real(dp), intent(inout) :: x(n)
        type(gmres_report_t), intent(out) :: rep
        integer :: m, cyc, j, i, k
        real(dp), allocatable :: v(:, :), h(:, :), cs(:), sn(:), g(:), y(:), r(:), w(:)
        real(dp) :: beta, denom, tmp, hij

        m = min(cfg%restart_m, n)
        allocate(v(n, m + 1), h(m + 1, m), cs(m), sn(m), g(m + 1), y(m), r(n), w(n))
        rep%total_iters = 0
        rep%status = ERR_OK

        do cyc = 1, cfg%max_restarts
            r = b - matmul(a, x)
            beta = sqrt(dot_product(r, r))
            rep%residual_norm = beta
            if (beta <= cfg%tol) return

            v = 0.0_dp
            h = 0.0_dp
            g = 0.0_dp
            v(:, 1) = r / beta
            g(1) = beta

            k = 0
            do j = 1, m
                w = matmul(a, v(:, j))
                do i = 1, j
                    hij = dot_product(w, v(:, i))
                    h(i, j) = hij
                    w = w - hij * v(:, i)
                end do
                h(j + 1, j) = sqrt(dot_product(w, w))
                if (h(j + 1, j) > 1.0e-14_dp) then
                    v(:, j + 1) = w / h(j + 1, j)
                end if

                do i = 1, j - 1
                    tmp = cs(i) * h(i, j) + sn(i) * h(i + 1, j)
                    h(i + 1, j) = -sn(i) * h(i, j) + cs(i) * h(i + 1, j)
                    h(i, j) = tmp
                end do
                denom = hypot(h(j, j), h(j + 1, j))
                if (denom < 1.0e-30_dp) then
                    rep%status = ERR_SINGULAR
                    return
                end if
                cs(j) = h(j, j) / denom
                sn(j) = h(j + 1, j) / denom
                h(j, j) = cs(j) * h(j, j) + sn(j) * h(j + 1, j)
                h(j + 1, j) = 0.0_dp

                g(j + 1) = -sn(j) * g(j)
                g(j) = cs(j) * g(j)
                k = j
                rep%total_iters = rep%total_iters + 1
                rep%residual_norm = abs(g(j + 1))
                if (rep%residual_norm <= cfg%tol) exit
            end do

            y(1:k) = 0.0_dp
            do i = k, 1, -1
                tmp = g(i)
                do j = i + 1, k
                    tmp = tmp - h(i, j) * y(j)
                end do
                y(i) = tmp / h(i, i)
            end do
            do j = 1, k
                x = x + y(j) * v(:, j)
            end do
            if (rep%residual_norm <= cfg%tol) return
        end do
        rep%status = ERR_NO_CONV
    end subroutine gmres_solve
end module m_gmr_core
