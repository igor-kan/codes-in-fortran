! Core type specifications for Compressed Row Storage Sparse Matrix Operations
! Module: sparse_crs_matrix

module sparse_crs_matrix_types
  use, intrinsic :: iso_c_binding
  implicit none
  private

  public :: sparse_crs_matrix_config_t, sparse_crs_matrix_context_t, sparse_crs_matrix_init_config

  integer, parameter, public :: ALIGNMENT = 64
  integer, parameter, public :: SUCCESS = 0
  integer, parameter, public :: ERR_INVALID_PARAM = -1

  type, bind(C) :: sparse_crs_matrix_config_t
     integer(c_int64_t) :: capacity = 1024_c_int64_t
     real(c_double)     :: tolerance = 1.0d-12
     integer(c_int32_t) :: flags = 0_c_int32_t
  end type sparse_crs_matrix_config_t

  type :: sparse_crs_matrix_context_t
     type(sparse_crs_matrix_config_t) :: config
     integer(c_int64_t)    :: operations_count = 0_c_int64_t
     real(c_double), allocatable :: buffer(:)
  end type sparse_crs_matrix_context_t

contains

  subroutine sparse_crs_matrix_init_config(cfg)
    type(sparse_crs_matrix_config_t), intent(out) :: cfg
    cfg%capacity = 1024_c_int64_t
    cfg%tolerance = 1.0d-12
    cfg%flags = 0_c_int32_t
  end subroutine sparse_crs_matrix_init_config

end module sparse_crs_matrix_types
