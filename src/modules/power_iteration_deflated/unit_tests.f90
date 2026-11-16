program test_pwr_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_pwr_types
    use m_pwr_err
    use m_pwr_core
    use m_pwr_val
    use m_pwr_inv
    implicit none
    integer, parameter :: n = 4, k = 3
    real(dp) :: a(n, n), evals(k), evecs(n, k)
    type(power_opts_t) :: opts
    integer :: i, code
    a = 0.0_dp
    do i = 1, n
        a(i, i) = real(20 - 4 * i, dp)
    end do
    a(1, 2) = 0.5_dp; a(2, 1) = 0.5_dp
    if (validate_power_args(n, k, a) /= ERR_OK) stop 1
    call top_k_eigenpairs_deflated(n, k, a, opts, evals, evecs, code)
    if (code /= ERR_OK) stop 2
    if (.not. check_deflation_orthogonality(n, k, a, evals, evecs, 1.0e-8_dp)) stop 3
end program test_pwr_unit
