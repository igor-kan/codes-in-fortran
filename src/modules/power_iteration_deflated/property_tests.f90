program test_pwr_prop
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_pwr_types
    use m_pwr_err
    use m_pwr_core
    use m_pwr_conc
    implicit none
    integer, parameter :: n = 5, k = 3
    real(dp) :: a(n, n), evals(k), evecs(n, k), rq(k)
    type(power_opts_t) :: opts
    integer :: i, j, code
    do i = 1, n
        do j = 1, n
            a(i, j) = exp(-0.5_dp * real((i - j) * (i - j), dp))
        end do
        a(i, i) = a(i, i) + real(2 * (n - i), dp)
    end do
    call top_k_eigenpairs_deflated(n, k, a, opts, evals, evecs, code)
    if (code /= ERR_OK) stop 1
    call batch_rayleigh_evals(n, k, a, evecs, rq)
    if (maxval(abs(rq - evals)) > 1.0e-10_dp) stop 2
end program test_pwr_prop
