module vector_l2_norm_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: l2_norm
contains
    pure function l2_norm(dot_prod) result(res)
        real(real64), intent(in) :: dot_prod
        real(real64) :: res
        res = sqrt(dot_prod)
    end function l2_norm
end module vector_l2_norm_f90_mod
