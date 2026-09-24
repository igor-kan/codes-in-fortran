module ornstein_drift_term_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: ou_drift
contains
    pure function ou_drift(theta, mu, x) result(res)
        real(real64), intent(in) :: theta, mu, x
        real(real64) :: res
        res = theta * (mu - x)
    end function ou_drift
end module ornstein_drift_term_f90_mod
