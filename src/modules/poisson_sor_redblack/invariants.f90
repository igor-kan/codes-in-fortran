module m_sor_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function max_boundary_drift(nx, ny, u) result(drift)
        integer, intent(in) :: nx, ny
        real(dp), intent(in) :: u(nx, ny)
        real(dp) :: drift
        drift = max(maxval(abs(u(1, :))), maxval(abs(u(nx, :))), &
                    maxval(abs(u(:, 1))), maxval(abs(u(:, ny))))
    end function max_boundary_drift
end module m_sor_inv
