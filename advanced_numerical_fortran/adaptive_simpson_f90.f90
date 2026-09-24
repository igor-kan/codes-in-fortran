module adaptive_simpson_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: simpson_step
contains
    pure function simpson_step(fa, fm, fb, h) result(area)
        real(real64), intent(in) :: fa, fm, fb, h
        real(real64) :: area
        area = (h / 6.0_real64) * (fa + 4.0_real64 * fm + fb)
    end function simpson_step
end module adaptive_simpson_f90_mod
