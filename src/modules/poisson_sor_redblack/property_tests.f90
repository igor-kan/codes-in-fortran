program test_sor_prop
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_sor_types
    use m_sor_core
    use m_sor_fast
    use m_sor_conc
    implicit none
    integer, parameter :: n1 = 9, n2 = 17
    real(dp) :: e1, e2
    e1 = run_grid(n1)
    e2 = run_grid(n2)
    if (e1 / e2 < 3.5_dp) stop 1
contains
    function run_grid(n) result(err)
        integer, intent(in) :: n
        real(dp) :: err, h, pi, u(n, n), rhs(n, n), exact(n, n), x, y
        type(sor_config_t) :: cfg
        type(sor_report_t) :: rep
        integer :: i, j
        pi = 4.0_dp * atan(1.0_dp)
        h = 1.0_dp / real(n - 1, dp)
        cfg%omega = optimal_sor_omega(n)
        cfg%tol = 1.0e-11_dp
        u = 0.0_dp
        do j = 1, n
            y = real(j - 1, dp) * h
            do i = 1, n
                x = real(i - 1, dp) * h
                exact(i, j) = sin(pi * x) * sin(pi * y)
                rhs(i, j) = 2.0_dp * pi * pi * exact(i, j)
            end do
        end do
        call redblack_concurrent_sweep(n, n, h * h, cfg%omega, rhs, u, 0)
        call solve_poisson_redblack(n, n, h, rhs, cfg, u, rep)
        err = maxval(abs(u - exact))
    end function run_grid
end program test_sor_prop
