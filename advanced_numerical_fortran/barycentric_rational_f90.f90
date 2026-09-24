module barycentric_rational_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: bary_weight
contains
    pure function bary_weight(k) result(w)
        integer, intent(in) :: k
        real(real64) :: w
        w = (-1.0_real64)**k
    end function bary_weight
end module barycentric_rational_f90_mod
