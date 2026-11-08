! Core type specifications for Type-Safe Modern Fortran BLAS Interface Wrappers
! Module: blas_interface_wrappers

module blas_interface_wrappers_types
  use, intrinsic :: iso_c_binding
  implicit none
  private

  public :: blas_interface_wrappers_config_t, blas_interface_wrappers_context_t, blas_interface_wrappers_init_config

  integer, parameter, public :: ALIGNMENT = 64
  integer, parameter, public :: SUCCESS = 0
  integer, parameter, public :: ERR_INVALID_PARAM = -1

  type, bind(C) :: blas_interface_wrappers_config_t
     integer(c_int64_t) :: capacity = 1024_c_int64_t
     real(c_double)     :: tolerance = 1.0d-12
     integer(c_int32_t) :: flags = 0_c_int32_t
  end type blas_interface_wrappers_config_t

  type :: blas_interface_wrappers_context_t
     type(blas_interface_wrappers_config_t) :: config
     integer(c_int64_t)    :: operations_count = 0_c_int64_t
     real(c_double), allocatable :: buffer(:)
  end type blas_interface_wrappers_context_t

contains

  subroutine blas_interface_wrappers_init_config(cfg)
    type(blas_interface_wrappers_config_t), intent(out) :: cfg
    cfg%capacity = 1024_c_int64_t
    cfg%tolerance = 1.0d-12
    cfg%flags = 0_c_int32_t
  end subroutine blas_interface_wrappers_init_config

end module blas_interface_wrappers_types
