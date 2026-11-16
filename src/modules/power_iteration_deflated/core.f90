module m_pwr_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_pwr_types
    use m_pwr_err
    implicit none
contains
    subroutine top_k_eigenpairs_deflated(n, k, a_in, opts, evals, evecs, code)
        integer, intent(in) :: n, k
        real(dp), intent(in) :: a_in(n, n)
        type(power_opts_t), intent(in) :: opts
        real(dp), intent(out) :: evals(k), evecs(n, k)
        integer, intent(out) :: code
        real(dp) :: cur(n, n), v(n), w(n), rvec(n), lam, nrm
        integer :: m, it, i, j

        if (n <= 0 .or. k <= 0 .or. k > n) then
            code = ERR_DIM
            return
        end if
        cur = a_in
        code = ERR_OK
        do m = 1, k
            do i = 1, n
                v(i) = real(mod(i * 7 + m * 3, 11) + 1, dp)
            end do
            do j = 1, m - 1
                v = v - dot_product(v, evecs(:, j)) * evecs(:, j)
            end do
            nrm = sqrt(sum(v * v))
            if (nrm < 1.0e-14_dp) then
                code = ERR_SING
                return
            end if
            v = v / nrm
            do it = 1, opts%max_iter
                w = matmul(cur, v)
                do j = 1, m - 1
                    w = w - dot_product(w, evecs(:, j)) * evecs(:, j)
                end do
                nrm = sqrt(sum(w * w))
                if (nrm < 1.0e-14_dp) exit
                v = w / nrm
                do j = 1, m - 1
                    v = v - dot_product(v, evecs(:, j)) * evecs(:, j)
                end do
                v = v / sqrt(sum(v * v))
                lam = dot_product(v, matmul(cur, v))
                rvec = matmul(cur, v) - lam * v
                if (sqrt(sum(rvec * rvec)) <= opts%tol) exit
            end do
            lam = dot_product(v, matmul(a_in, v))
            evals(m) = lam
            evecs(:, m) = v
            do j = 1, n
                do i = 1, n
                    cur(i, j) = cur(i, j) - lam * v(i) * v(j)
                end do
            end do
        end do
    end subroutine top_k_eigenpairs_deflated
end module m_pwr_core
