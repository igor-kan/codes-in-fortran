! Core type specifications for Chebyshev Pseudospectral Differentiation Matrix
! Module: chebyshev_spectral_diff

module chebyshev_spectral_diff_types
  use, intrinsic :: iso_c_binding
  implicit none
  private

  public :: chebyshev_spectral_diff_config_t, chebyshev_spectral_diff_context_t, chebyshev_spectral_diff_init_config

  integer, parameter, public :: ALIGNMENT = 64
  integer, parameter, public :: SUCCESS = 0
  integer, parameter, public :: ERR_INVALID_PARAM = -1

  type, bind(C) :: chebyshev_spectral_diff_config_t
     integer(c_int64_t) :: capacity = 1024_c_int64_t
     real(c_double)     :: tolerance = 1.0d-12
     integer(c_int32_t) :: flags = 0_c_int32_t
  end type chebyshev_spectral_diff_config_t

  type :: chebyshev_spectral_diff_context_t
     type(chebyshev_spectral_diff_config_t) :: config
     integer(c_int64_t)    :: operations_count = 0_c_int64_t
     real(c_double), allocatable :: buffer(:)
  end type chebyshev_spectral_diff_context_t

contains

  subroutine chebyshev_spectral_diff_init_config(cfg)
    type(chebyshev_spectral_diff_config_t), intent(out) :: cfg
    cfg%capacity = 1024_c_int64_t
    cfg%tolerance = 1.0d-12
    cfg%flags = 0_c_int32_t
  end subroutine chebyshev_spectral_diff_init_config

end module chebyshev_spectral_diff_types
