module m_gl3_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_gl3_types
    use m_gl3_err
    use m_gl3_ifc
    implicit none
contains
pure function gl3_integrate_poly5(a, b) result(val)
        real(dp), intent(in) :: a, b
        real(dp) :: val, mid, half, x0, x1, f0, fm, fp
        mid = 0.5_dp * (a + b)
        half = 0.5_dp * (b - a)
        x0 = sqrt(0.6_dp) * half
        f0 = mid**5 + 2.0_dp * mid**3
        x1 = mid - x0
        fm = x1**5 + 2.0_dp * x1**3
        x1 = mid + x0
        fp = x1**5 + 2.0_dp * x1**3
        val = half * ((8.0_dp / 9.0_dp) * f0 + (5.0_dp / 9.0_dp) * (fm + fp))
    end function gl3_integrate_poly5
end module m_gl3_core
