module m_fft_types
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    type :: fft_plan_t
        integer :: length = 0
        integer :: log2_n = 0
        logical :: inverse = .false.
    end type fft_plan_t
end module m_fft_types
