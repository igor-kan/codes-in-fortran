program test_brg_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_brg_types
    use m_brg_err
    use m_brg_core
    use m_brg_val
    use m_brg_fast
    use m_brg_inv
    implicit none
    integer, parameter :: n = 64
    real(dp) :: u(n), pi, m0, m1, ke0, ke1
    type(burgers_params_t) :: p
    integer :: i, k, st

    pi = 4.0_dp * atan(1.0_dp)
    p%dx = 2.0_dp * pi / real(n, dp)
    p%viscosity = 0.05_dp
    do i = 1, n
        u(i) = sin(real(i - 1, dp) * p%dx) + 0.5_dp
    end do
    p%dt = compute_cfl_dt(n, u, p%dx, p%viscosity, 0.4_dp)
    if (validate_burgers_params(n, p) /= ERR_OK) stop 1
    m0 = discrete_mass(n, p%dx, u)
    ke0 = kinetic_energy(n, p%dx, u)
    do k = 1, 40
        call step_burgers_periodic(n, p, u, st)
        if (st /= ERR_OK) stop 2
    end do
    m1 = discrete_mass(n, p%dx, u)
    ke1 = kinetic_energy(n, p%dx, u)
    if (abs(m1 - m0) > 1.0e-12_dp) stop 3
    if (ke1 >= ke0) stop 4
end program test_brg_unit
