program test_ver_prop
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ver_conc
    implicit none
    real(dp) :: vys(4), drifts(4)
    vys = [0.7_dp, 0.9_dp, 1.0_dp, 1.25_dp]
    call batch_energy_drifts(4, vys, 1.0_dp, 0.004_dp, 2500, drifts)
    if (maxval(drifts) > 5.0e-4_dp) stop 1
end program test_ver_prop
