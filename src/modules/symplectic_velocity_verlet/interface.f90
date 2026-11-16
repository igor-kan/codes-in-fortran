module m_ver_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    abstract interface
        pure subroutine accel_iface(x, y, ax, ay)
            import :: dp
            real(dp), intent(in) :: x, y
            real(dp), intent(out) :: ax, ay
        end subroutine accel_iface
    end interface
end module m_ver_ifc
