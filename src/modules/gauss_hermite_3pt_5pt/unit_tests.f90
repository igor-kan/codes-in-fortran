program test_unit
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gh5_types
    use m_gh5_core
    use m_gh5_inv
    use m_gh5_val
    implicit none
real(dp), parameter :: sqpi = sqrt(acos(-1.0_dp))
    call assert_close_dp(gauss_hermite_5pt_even_pow(0), sqpi, 1.0e-12_dp)
    call assert_close_dp(gauss_hermite_5pt_even_pow(2), 0.5_dp * sqpi, 1.0e-12_dp)
    call assert_close_dp(gauss_hermite_5pt_even_pow(4), 0.75_dp * sqpi, 1.0e-12_dp)
    block
        integer :: st
        call check_pos_n(1, st)
        if (st /= 0) error stop 'val failed'
    end block
end program test_unit
