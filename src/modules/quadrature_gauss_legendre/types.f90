! Core type specifications for Gauss-Legendre Quadrature Weights and Integration
! Module: quadrature_gauss_legendre

module quadrature_gauss_legendre_types
  use, intrinsic :: iso_c_binding
  implicit none
  private

  public :: quadrature_gauss_legendre_config_t, quadrature_gauss_legendre_context_t, quadrature_gauss_legendre_init_config

  integer, parameter, public :: ALIGNMENT = 64
  integer, parameter, public :: SUCCESS = 0
  integer, parameter, public :: ERR_INVALID_PARAM = -1

  type, bind(C) :: quadrature_gauss_legendre_config_t
     integer(c_int64_t) :: capacity = 1024_c_int64_t
     real(c_double)     :: tolerance = 1.0d-12
     integer(c_int32_t) :: flags = 0_c_int32_t
  end type quadrature_gauss_legendre_config_t

  type :: quadrature_gauss_legendre_context_t
     type(quadrature_gauss_legendre_config_t) :: config
     integer(c_int64_t)    :: operations_count = 0_c_int64_t
     real(c_double), allocatable :: buffer(:)
  end type quadrature_gauss_legendre_context_t

contains

  subroutine quadrature_gauss_legendre_init_config(cfg)
    type(quadrature_gauss_legendre_config_t), intent(out) :: cfg
    cfg%capacity = 1024_c_int64_t
    cfg%tolerance = 1.0d-12
    cfg%flags = 0_c_int32_t
  end subroutine quadrature_gauss_legendre_init_config

end module quadrature_gauss_legendre_types
