program test_gmr_prop
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gmr_types
    use m_gmr_core
    use m_gmr_fast
    use m_gmr_conc
    use m_gmr_inv
    implicit none
    integer, parameter :: n = 10
    real(dp) :: a(n, n), b(n), x(n), inv_d(n), xm(n, 2), ym(n, 2)
    type(gmres_config_t) :: cfg
    type(gmres_report_t) :: rep
    integer :: j

    a = 0.0_dp
    do j = 1, n
        a(j, j) = 5.0_dp
        if (j > 1) a(j - 1, j) = 1.2_dp
        if (j < n) a(j + 1, j) = -0.8_dp
        b(j) = real(j, dp) * 0.5_dp
    end do
    x = 0.0_dp
    call scale_jacobi_system(n, a, b, inv_d)
    call gmres_solve(n, a, b, cfg, x, rep)
    if (rep%status /= 0) stop 1
    if (true_residual_norm(n, a, b, x) > 1.0e-9_dp) stop 2
    xm(:, 1) = x
    xm(:, 2) = x
    call matvec_batch(n, 2, a, xm, ym)
    if (sqrt(sum((ym(:, 2) - b) ** 2)) > 1.0e-9_dp) stop 3
end program test_gmr_prop
