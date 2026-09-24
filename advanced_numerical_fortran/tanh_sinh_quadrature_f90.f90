module tanh_sinh_quadrature_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    real(real64), parameter :: PI = 3.14159265358979323846_real64
    public :: tanh_sinh_map
contains
    pure function tanh_sinh_map(t) result(x)
        real(real64), intent(in) :: t
        real(real64) :: x
        x = tanh(0.5_real64 * PI * sinh(t))
    end function tanh_sinh_map
end module tanh_sinh_quadrature_f90_mod
