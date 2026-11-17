module m_sec_fast
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_sec_ifc
    implicit none
contains
    pure function steffensen_step(g, x) result(x_next)
        procedure(fn_scalar) :: g
        real(dp), intent(in) :: x
        real(dp) :: x_next, gx, ggx, denom
        gx = g(x)
        ggx = g(gx)
        denom = ggx - 2.0_dp * gx + x
        if (abs(denom) < 1.0e-30_dp) then
            x_next = gx
        else
            x_next = x - ((gx - x)**2) / denom
        end if
    end function steffensen_step
end module m_sec_fast
