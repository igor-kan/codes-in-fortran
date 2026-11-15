module m_brg_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function compute_cfl_dt(n, u, dx, nu, safety) result(dt)
        integer, intent(in) :: n
        real(dp), intent(in) :: u(n), dx, nu, safety
        real(dp) :: dt, umax, denom
        umax = max(maxval(abs(u)), 1.0e-12_dp)
        denom = umax / dx + 2.0_dp * nu / (dx * dx)
        dt = safety / denom
    end function compute_cfl_dt
end module m_brg_fast
