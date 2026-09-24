module chebyshev_collocation_nodes_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    real(real64), parameter :: PI = 3.14159265358979323846_real64
    public :: cheb_node
contains
    pure function cheb_node(j, n) result(x)
        integer, intent(in) :: j, n
        real(real64) :: x
        x = cos(PI * real(j, real64) / real(n, real64))
    end function cheb_node
end module chebyshev_collocation_nodes_f90_mod
