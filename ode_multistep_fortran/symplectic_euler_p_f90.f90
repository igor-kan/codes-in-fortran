module symplectic_euler_p_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: symp_p
contains
    pure function symp_p(p, grad_v, dt) result(res)
        real(real64), intent(in) :: p, grad_v, dt
        real(real64) :: res
        res = p - dt * grad_v
    end function symp_p
end module symplectic_euler_p_f90_mod
