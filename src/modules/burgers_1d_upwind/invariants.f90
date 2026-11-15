module m_brg_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function discrete_mass(n, dx, u) result(mass)
        integer, intent(in) :: n
        real(dp), intent(in) :: dx, u(n)
        real(dp) :: mass
        mass = sum(u) * dx
    end function discrete_mass

    pure function kinetic_energy(n, dx, u) result(ke)
        integer, intent(in) :: n
        real(dp), intent(in) :: dx, u(n)
        real(dp) :: ke
        ke = 0.5_dp * sum(u * u) * dx
    end function kinetic_energy
end module m_brg_inv
