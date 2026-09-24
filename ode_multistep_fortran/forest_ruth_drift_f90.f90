module forest_ruth_drift_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: forest_theta
contains
    pure function forest_theta(theta) result(res)
        real(real64), intent(in) :: theta
        real(real64) :: res
        res = theta
    end function forest_theta
end module forest_ruth_drift_f90_mod
