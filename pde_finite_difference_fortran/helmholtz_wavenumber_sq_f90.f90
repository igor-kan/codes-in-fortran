module helmholtz_wavenumber_sq_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: helmholtz_k2
contains
    pure function helmholtz_k2(k) result(res)
        real(real64), intent(in) :: k
        real(real64) :: res
        res = k * k
    end function helmholtz_k2
end module helmholtz_wavenumber_sq_f90_mod
