module step_size_pid_controller_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: pid_h_factor
contains
    pure function pid_h_factor(err, tol) result(res)
        real(real64), intent(in) :: err, tol
        real(real64) :: res
        res = (tol / err)**0.2_real64
    end function pid_h_factor
end module step_size_pid_controller_f90_mod
