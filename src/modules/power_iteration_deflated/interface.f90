module m_pwr_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    abstract interface
        pure function norm_iface(n, v) result(val)
            import :: dp
            integer, intent(in) :: n
            real(dp), intent(in) :: v(n)
            real(dp) :: val
        end function norm_iface
    end interface
end module m_pwr_ifc
