module m_akm_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_akm_types
    implicit none
    abstract interface
        pure function eval_spline_iface(n, segs, x) result(y)
            import :: dp, akima_seg_t
            integer, intent(in) :: n
            type(akima_seg_t), intent(in) :: segs(n - 1)
            real(dp), intent(in) :: x
            real(dp) :: y
        end function eval_spline_iface
    end interface
end module m_akm_ifc
