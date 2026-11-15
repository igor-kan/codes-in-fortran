program test_brg_prop
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_brg_types
    use m_brg_err
    use m_brg_core
    use m_brg_conc
    use m_brg_fast
    implicit none
    integer, parameter :: n = 32
    real(dp) :: u(n), f(n)
    type(burgers_params_t) :: p
    integer :: st

    u = 1.5_dp
    p%dx = 0.1_dp
    p%viscosity = 0.0_dp
    p%dt = compute_cfl_dt(n, u, p%dx, p%viscosity, 0.5_dp)
    call step_burgers_periodic(n, p, u, st)
    if (st /= ERR_OK) stop 1
    if (maxval(abs(u - 1.5_dp)) > 1.0e-14_dp) stop 2
    call compute_flux_array(n, u, f)
    if (maxval(abs(f - 0.5_dp * 2.25_dp)) > 1.0e-14_dp) stop 3
end program test_brg_prop
