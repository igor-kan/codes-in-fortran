program test_sor_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_sor_types
    use m_sor_err
    use m_sor_core
    use m_sor_val
    use m_sor_fast
    use m_sor_inv
    implicit none
    integer, parameter :: n = 17
    real(dp) :: pi, h, x, y, u(n, n), rhs(n, n), exact(n, n), l2err
    type(sor_config_t) :: cfg
    type(sor_report_t) :: rep
    integer :: i, j

    pi = 4.0_dp * atan(1.0_dp)
    h = 1.0_dp / real(n - 1, dp)
    cfg%omega = optimal_sor_omega(n)
    cfg%tol = 1.0e-10_dp
    if (validate_sor_setup(n, n, h, cfg) /= ERR_OK) stop 1
    u = 0.0_dp
    do j = 1, n
        y = real(j - 1, dp) * h
        do i = 1, n
            x = real(i - 1, dp) * h
            exact(i, j) = sin(pi * x) * sin(pi * y)
            rhs(i, j) = 2.0_dp * pi * pi * exact(i, j)
        end do
    end do
    call solve_poisson_redblack(n, n, h, rhs, cfg, u, rep)
    if (rep%status /= ERR_OK) stop 2
    if (max_boundary_drift(n, n, u) > 1.0e-14_dp) stop 3
    l2err = maxval(abs(u - exact))
    if (l2err > 5.0e-3_dp) stop 4
end program test_sor_unit
