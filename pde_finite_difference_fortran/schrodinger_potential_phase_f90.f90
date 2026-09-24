module schrodinger_potential_phase_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: v_phase
contains
    pure function v_phase(v, dt, hbar) result(res)
        real(real64), intent(in) :: v, dt, hbar
        real(real64) :: res
        res = v * dt / (2.0_real64 * hbar)
    end function v_phase
end module schrodinger_potential_phase_f90_mod
