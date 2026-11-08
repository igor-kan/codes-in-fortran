! Core type specifications for Adaptive 5(4) Dormand-Prince ODE Integrator
! Module: runge_kutta_dormand_prince

module runge_kutta_dormand_prince_types
  use, intrinsic :: iso_c_binding
  implicit none
  private

  public :: runge_kutta_dormand_prince_config_t, runge_kutta_dormand_prince_context_t, runge_kutta_dormand_prince_init_config

  integer, parameter, public :: ALIGNMENT = 64
  integer, parameter, public :: SUCCESS = 0
  integer, parameter, public :: ERR_INVALID_PARAM = -1

  type, bind(C) :: runge_kutta_dormand_prince_config_t
     integer(c_int64_t) :: capacity = 1024_c_int64_t
     real(c_double)     :: tolerance = 1.0d-12
     integer(c_int32_t) :: flags = 0_c_int32_t
  end type runge_kutta_dormand_prince_config_t

  type :: runge_kutta_dormand_prince_context_t
     type(runge_kutta_dormand_prince_config_t) :: config
     integer(c_int64_t)    :: operations_count = 0_c_int64_t
     real(c_double), allocatable :: buffer(:)
  end type runge_kutta_dormand_prince_context_t

contains

  subroutine runge_kutta_dormand_prince_init_config(cfg)
    type(runge_kutta_dormand_prince_config_t), intent(out) :: cfg
    cfg%capacity = 1024_c_int64_t
    cfg%tolerance = 1.0d-12
    cfg%flags = 0_c_int32_t
  end subroutine runge_kutta_dormand_prince_init_config

end module runge_kutta_dormand_prince_types
