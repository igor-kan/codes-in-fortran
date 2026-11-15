module m_sor_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function optimal_sor_omega(n) result(w)
        integer, intent(in) :: n
        real(dp) :: w, pi, rho
        pi = 4.0_dp * atan(1.0_dp)
        rho = cos(pi / real(n - 1, dp))
        w = 2.0_dp / (1.0_dp + sqrt(1.0_dp - rho * rho))
    end function optimal_sor_omega
end module m_sor_fast
