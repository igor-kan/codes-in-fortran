program test_schrodinger_potential_phase_f90
    use, intrinsic :: iso_fortran_env, only: real64
    use schrodinger_potential_phase_f90_mod, only: v_phase
    implicit none
    if (abs(v_phase(2.0_real64, 0.1_real64, 1.0_real64) - (0.1_real64)) > 1.0e-7) stop 1
    write(*,*) "test_schrodinger_potential_phase_f90 passed."
end program test_schrodinger_potential_phase_f90
