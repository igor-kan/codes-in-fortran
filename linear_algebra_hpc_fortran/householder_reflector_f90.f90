module householder_reflector_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: householder_scalar
contains
    pure function householder_scalar(v0, norm) result(res)
        real(real64), intent(in) :: v0, norm
        real(real64) :: res
        res = v0 + norm
    end function householder_scalar
end module householder_reflector_f90_mod
