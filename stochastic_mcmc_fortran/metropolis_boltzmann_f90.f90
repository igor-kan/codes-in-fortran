module metropolis_boltzmann_f90_mod
    use, intrinsic :: iso_fortran_env, only: real64
    implicit none
    public :: boltzmann_prob
contains
    pure function boltzmann_prob(de, beta) result(res)
        real(real64), intent(in) :: de, beta
        real(real64) :: res
        res = exp(-beta * de)
    end function boltzmann_prob
end module metropolis_boltzmann_f90_mod
