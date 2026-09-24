module gauss_lobatto_weights_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: lobatto_endpoint_weight
contains
    pure function lobatto_endpoint_weight(n) result(w)
        integer, intent(in) :: n
        real(real64) :: w
        w = 2.0_real64 / (real(n * (n - 1), real64))
    end function lobatto_endpoint_weight
end module gauss_lobatto_weights_f90_mod
