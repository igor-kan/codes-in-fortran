module m_cgf_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_cgf_types
    use m_cgf_err
    implicit none
contains
    subroutine pcg_dense_solve(n, a, b, x, cfg, rep)
        integer, intent(in) :: n
        real(dp), intent(in) :: a(n, n), b(n)
        real(dp), intent(inout) :: x(n)
        type(cg_config_t), intent(in) :: cfg
        type(cg_report_t), intent(out) :: rep
        real(dp) :: r(n), z(n), p(n), ap(n), minv(n)
        real(dp) :: rz_old, rz_new, pap, alpha, beta, bnorm, rnorm
        integer :: i, k

        rep%status = ERR_OK
        rep%iters = 0
        do i = 1, n
            if (abs(a(i, i)) < 1.0e-14_dp) then
                rep%status = ERR_SING
                return
            end if
            minv(i) = 1.0_dp / a(i, i)
        end do
        bnorm = max(1.0_dp, sqrt(sum(b * b)))
        r = b - matmul(a, x)
        z = minv * r
        p = z
        rz_old = dot_product(r, z)
        do k = 1, cfg%max_iter
            rnorm = sqrt(sum(r * r)) / bnorm
            rep%rel_residual = rnorm
            if (rnorm <= cfg%tol) return
            ap = matmul(a, p)
            pap = dot_product(p, ap)
            if (pap <= 1.0e-30_dp) then
                rep%status = ERR_CONV
                return
            end if
            alpha = rz_old / pap
            x = x + alpha * p
            r = r - alpha * ap
            z = minv * r
            rz_new = dot_product(r, z)
            beta = rz_new / rz_old
            p = z + beta * p
            rz_old = rz_new
            rep%iters = k
        end do
        rep%rel_residual = sqrt(sum(r * r)) / bnorm
        if (rep%rel_residual > cfg%tol) rep%status = ERR_CONV
    end subroutine pcg_dense_solve
end module m_cgf_core
