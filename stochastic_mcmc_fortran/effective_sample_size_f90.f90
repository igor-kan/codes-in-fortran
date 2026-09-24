module effective_sample_size_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: ess_stat
contains
    pure function ess_stat(sum_w2) result(res)
        real(real64), intent(in) :: sum_w2
        real(real64) :: res
        res = 1.0_real64 / sum_w2
    end function ess_stat
end module effective_sample_size_f90_mod
