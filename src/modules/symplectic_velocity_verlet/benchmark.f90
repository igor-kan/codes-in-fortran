program bench_symplectic_velocity_verlet
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ver_types
    use m_ver_core
    implicit none
    integer :: it
    real(dp) :: t0, t1, sink
    type(orbit_state_t) :: st
    sink = 0.0_dp
    call cpu_time(t0)
    do it = 1, 50
        st = orbit_state_t(1.0_dp, 0.0_dp, 0.0_dp, 1.1_dp)
        call integrate_orbit(st, 1.0_dp, 0.01_dp, 500)
        sink = sink + abs(st%x)
    end do
    call cpu_time(t1)
    print '(A,F10.4,A,ES12.4)', 'symplectic_velocity_verlet ms=', (t1 - t0) * 20.0_dp, ' sink=', sink
end program bench_symplectic_velocity_verlet
