module m_fft_ifc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_fft_types
    implicit none
    abstract interface
        subroutine fft_exec_iface(plan, buf, status)
            import :: dp, fft_plan_t
            type(fft_plan_t), intent(in) :: plan
            complex(dp), intent(inout) :: buf(plan%length)
            integer, intent(out) :: status
        end subroutine fft_exec_iface
    end interface
end module m_fft_ifc
