module m_brg_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: burgers_params_t
        real(dp) :: dx = 0.01_dp
        real(dp) :: dt = 0.002_dp
        real(dp) :: viscosity = 0.01_dp
        integer :: steps = 100
    end type burgers_params_t
end module m_brg_types
