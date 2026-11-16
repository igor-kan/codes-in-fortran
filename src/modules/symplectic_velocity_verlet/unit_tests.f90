program test_ver_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ver_types
    use m_ver_err
    use m_ver_core
    use m_ver_val
    use m_ver_inv
    implicit none
    type(orbit_state_t) :: st0, st1
    st0 = orbit_state_t(1.0_dp, 0.0_dp, 0.0_dp, 1.2_dp)
    st1 = st0
    if (validate_orbit_init(st0, 1.0_dp, 0.005_dp) /= ERR_OK) stop 1
    call integrate_orbit(st1, 1.0_dp, 0.005_dp, 4000)
    if (.not. check_symplectic_laws(st0, st1, 1.0_dp, 1.0e-4_dp, 1.0e-11_dp)) stop 2
    call integrate_orbit(st1, 1.0_dp, -0.005_dp, 4000)
    if (abs(st1%x - st0%x) > 1.0e-9_dp .or. abs(st1%y - st0%y) > 1.0e-9_dp) stop 3
end program test_ver_unit
