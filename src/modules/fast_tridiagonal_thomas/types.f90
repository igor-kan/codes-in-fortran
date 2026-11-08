! Core type specifications for Vectorized Thomas Algorithm for Tridiagonal Systems
! Module: fast_tridiagonal_thomas

module fast_tridiagonal_thomas_types
  use, intrinsic :: iso_c_binding
  implicit none
  private

  public :: fast_tridiagonal_thomas_config_t, fast_tridiagonal_thomas_context_t, fast_tridiagonal_thomas_init_config

  integer, parameter, public :: ALIGNMENT = 64
  integer, parameter, public :: SUCCESS = 0
  integer, parameter, public :: ERR_INVALID_PARAM = -1

  type, bind(C) :: fast_tridiagonal_thomas_config_t
     integer(c_int64_t) :: capacity = 1024_c_int64_t
     real(c_double)     :: tolerance = 1.0d-12
     integer(c_int32_t) :: flags = 0_c_int32_t
  end type fast_tridiagonal_thomas_config_t

  type :: fast_tridiagonal_thomas_context_t
     type(fast_tridiagonal_thomas_config_t) :: config
     integer(c_int64_t)    :: operations_count = 0_c_int64_t
     real(c_double), allocatable :: buffer(:)
  end type fast_tridiagonal_thomas_context_t

contains

  subroutine fast_tridiagonal_thomas_init_config(cfg)
    type(fast_tridiagonal_thomas_config_t), intent(out) :: cfg
    cfg%capacity = 1024_c_int64_t
    cfg%tolerance = 1.0d-12
    cfg%flags = 0_c_int32_t
  end subroutine fast_tridiagonal_thomas_init_config

end module fast_tridiagonal_thomas_types
