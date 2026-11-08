! Core type specifications for Pure and Elemental SIMD Vector Mathematics Routines
! Module: pure_vector_math

module pure_vector_math_types
  use, intrinsic :: iso_c_binding
  implicit none
  private

  public :: pure_vector_math_config_t, pure_vector_math_context_t, pure_vector_math_init_config

  integer, parameter, public :: ALIGNMENT = 64
  integer, parameter, public :: SUCCESS = 0
  integer, parameter, public :: ERR_INVALID_PARAM = -1

  type, bind(C) :: pure_vector_math_config_t
     integer(c_int64_t) :: capacity = 1024_c_int64_t
     real(c_double)     :: tolerance = 1.0d-12
     integer(c_int32_t) :: flags = 0_c_int32_t
  end type pure_vector_math_config_t

  type :: pure_vector_math_context_t
     type(pure_vector_math_config_t) :: config
     integer(c_int64_t)    :: operations_count = 0_c_int64_t
     real(c_double), allocatable :: buffer(:)
  end type pure_vector_math_context_t

contains

  subroutine pure_vector_math_init_config(cfg)
    type(pure_vector_math_config_t), intent(out) :: cfg
    cfg%capacity = 1024_c_int64_t
    cfg%tolerance = 1.0d-12
    cfg%flags = 0_c_int32_t
  end subroutine pure_vector_math_init_config

end module pure_vector_math_types
