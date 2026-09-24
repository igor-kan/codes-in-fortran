module arnoldi_hessenberg_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: hessenberg_h
contains
    pure function hessenberg_h(w_dot_v) result(res)
        real(real64), intent(in) :: w_dot_v
        real(real64) :: res
        res = w_dot_v
    end function hessenberg_h
end module arnoldi_hessenberg_f90_mod
