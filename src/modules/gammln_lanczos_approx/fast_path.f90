module m_gma_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gma_core
    implicit none
contains
    pure function log_binomial(n, k) result(lb)
        integer, intent(in) :: n, k
        real(dp) :: lb
        lb = log_gamma_lanczos(real(n + 1, dp)) - &
             log_gamma_lanczos(real(k + 1, dp)) - &
             log_gamma_lanczos(real(n - k + 1, dp))
    end function log_binomial
end module m_gma_fast
