program bench_brg
    use, intrinsic :: iso_fortran_env, only: dp => real64, int64
    use m_brg_types
    use m_brg_core
    use m_brg_fast
    implicit none
    integer, parameter :: n = 256
    real(dp) :: u(n)
    type(burgers_params_t) :: p
    integer(int64) :: t0, t1, rate
    integer :: k, st

    p%dx = 1.0_dp / real(n, dp)
    p%viscosity = 0.005_dp
    u = 0.5_dp
    p%dt = compute_cfl_dt(n, u, p%dx, p%viscosity, 0.4_dp)
    call system_clock(t0, rate)
    do k = 1, 200
        call step_burgers_periodic(n, p, u, st)
    end do
    call system_clock(t1)
    if (st /= 0 .or. t1 < t0 .or. rate <= 0) stop 1
end program bench_brg
