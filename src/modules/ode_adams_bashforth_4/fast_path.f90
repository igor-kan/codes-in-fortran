module m_ab4_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
contains
    pure function ab4_predictor(y, h, f3, f2, f1, f0) result(yn)
        real(dp), intent(in) :: y, h, f3, f2, f1, f0
        real(dp) :: yn
        yn = y + (h / 24.0_dp) * (55.0_dp * f3 - 59.0_dp * f2 + 37.0_dp * f1 - 9.0_dp * f0)
    end function ab4_predictor
end module m_ab4_fast
