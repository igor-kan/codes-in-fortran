! Core type specifications for Fortran 2018 PGAS Coarray Heat Conduction Solver
! Module: coarray_heat_equation

module coarray_heat_equation_types
  use, intrinsic :: iso_c_binding
  implicit none
  private

  public :: coarray_heat_equation_config_t, coarray_heat_equation_context_t, coarray_heat_equation_init_config

  integer, parameter, public :: ALIGNMENT = 64
  integer, parameter, public :: SUCCESS = 0
  integer, parameter, public :: ERR_INVALID_PARAM = -1

  type, bind(C) :: coarray_heat_equation_config_t
     integer(c_int64_t) :: capacity = 1024_c_int64_t
     real(c_double)     :: tolerance = 1.0d-12
     integer(c_int32_t) :: flags = 0_c_int32_t
  end type coarray_heat_equation_config_t

  type :: coarray_heat_equation_context_t
     type(coarray_heat_equation_config_t) :: config
     integer(c_int64_t)    :: operations_count = 0_c_int64_t
     real(c_double), allocatable :: buffer(:)
  end type coarray_heat_equation_context_t

contains

  subroutine coarray_heat_equation_init_config(cfg)
    type(coarray_heat_equation_config_t), intent(out) :: cfg
    cfg%capacity = 1024_c_int64_t
    cfg%tolerance = 1.0d-12
    cfg%flags = 0_c_int32_t
  end subroutine coarray_heat_equation_init_config

end module coarray_heat_equation_types
