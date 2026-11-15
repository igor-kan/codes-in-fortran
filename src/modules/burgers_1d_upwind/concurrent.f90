module m_brg_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure subroutine compute_flux_array(n, u, flux_edges)
        integer, intent(in) :: n
        real(dp), intent(in) :: u(n)
        real(dp), intent(out) :: flux_edges(n)
        integer :: i, ip1
        real(dp) :: amax
        do concurrent (i = 1:n)
            ip1 = merge(1, i + 1, i == n)
            amax = max(abs(u(i)), abs(u(ip1)))
            flux_edges(i) = 0.25_dp * (u(i) * u(i) + u(ip1) * u(ip1)) - 0.5_dp * amax * (u(ip1) - u(i))
        end do
    end subroutine compute_flux_array
end module m_brg_conc
