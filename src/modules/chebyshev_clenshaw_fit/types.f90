module m_ch_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: cheb_series_t
        integer :: deg = 0
        real(dp), allocatable :: c(:)
    end type cheb_series_t
end module m_ch_types
