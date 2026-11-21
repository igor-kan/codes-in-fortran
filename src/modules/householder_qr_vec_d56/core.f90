module m_hhqr_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_hhqr_types
    use m_hhqr_err
    use m_hhqr_ifc
    implicit none
contains
subroutine householder_reflect(x, y, n)
        integer, intent(in) :: n
        real(dp), intent(in) :: x(n)
        real(dp), intent(out) :: y(n)
        real(dp) :: v(n), nrm, alpha, vnorm2, dotvx
        integer :: i
        nrm = sqrt(sum(x * x))
        if (nrm == 0.0_dp) then
            y = 0.0_dp
            return
        end if
        if (x(1) >= 0.0_dp) then
            alpha = -nrm
        else
            alpha = nrm
        end if
        v = x
        v(1) = v(1) - alpha
        vnorm2 = sum(v * v)
        dotvx = sum(v * x)
        do i = 1, n
            y(i) = x(i) - 2.0_dp * (dotvx / vnorm2) * v(i)
        end do
    end subroutine householder_reflect
end module m_hhqr_core
