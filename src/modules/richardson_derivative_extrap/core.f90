module m_rde_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_rde_types
    use m_rde_err
    use m_rde_ifc
    implicit none
contains
pure function richardson_diff_sin(x, h0) result(d)
        real(dp), intent(in) :: x, h0
        real(dp) :: d, Dtab(4, 4), h, fac
        integer :: i, j
        h = h0
        do i = 1, 4
            Dtab(i, 1) = (sin(x + h) - sin(x - h)) / (2.0_dp * h)
            fac = 4.0_dp
            do j = 2, i
                Dtab(i, j) = Dtab(i, j - 1) + (Dtab(i, j - 1) - Dtab(i - 1, j - 1)) / (fac - 1.0_dp)
                fac = fac * 4.0_dp
            end do
            h = 0.5_dp * h
        end do
        d = Dtab(4, 4)
    end function richardson_diff_sin
end module m_rde_core
