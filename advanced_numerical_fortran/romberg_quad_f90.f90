module romberg_quad_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: romberg_step
contains
    pure function romberg_step(r_curr, r_prev, k) result(r_next)
        real(real64), intent(in) :: r_curr, r_prev
        integer, intent(in) :: k
        real(real64) :: r_next
        r_next = r_curr + (r_curr - r_prev) / (4.0_real64**k - 1.0_real64)
    end function romberg_step
end module romberg_quad_f90_mod
