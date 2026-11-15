module m_akm_inv
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_akm_types
    use m_akm_core
    implicit none
contains
    pure function max_knot_error(n, x, y, segs) result(err)
        integer, intent(in) :: n
        real(dp), intent(in) :: x(n), y(n)
        type(akima_seg_t), intent(in) :: segs(n - 1)
        real(dp) :: err
        integer :: i
        err = 0.0_dp
        do i = 1, n
            err = max(err, abs(eval_akima(n, segs, x(i)) - y(i)))
        end do
    end function max_knot_error
end module m_akm_inv
