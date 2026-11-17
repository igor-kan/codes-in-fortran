module m_s2d_core
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_s2d_types
    use m_s2d_ifc
    use m_s2d_err
    implicit none
contains
    subroutine simpson_2d(box, f, val, status)
        type(box2d_t), intent(in) :: box
        procedure(fn_2d) :: f
        real(dp), intent(out) :: val
        integer, intent(out) :: status
        real(dp) :: hx, hy, wx, wy, x, y, acc
        integer :: i, j
        if (box%nx < 2 .or. box%ny < 2 .or. mod(box%nx, 2) /= 0 .or. mod(box%ny, 2) /= 0) then
            status = ERR_DIM
            val = 0.0_dp
            return
        end if
        status = ERR_OK
        hx = (box%bx - box%ax) / real(box%nx, dp)
        hy = (box%by - box%ay) / real(box%ny, dp)
        acc = 0.0_dp
        do j = 0, box%ny
            y = box%ay + real(j, dp) * hy
            wy = merge(1.0_dp, merge(2.0_dp, 4.0_dp, mod(j, 2) == 0), j == 0 .or. j == box%ny)
            do i = 0, box%nx
                x = box%ax + real(i, dp) * hx
                wx = merge(1.0_dp, merge(2.0_dp, 4.0_dp, mod(i, 2) == 0), i == 0 .or. i == box%nx)
                acc = acc + wx * wy * f(x, y)
            end do
        end do
        val = acc * (hx * hy) / 9.0_dp
    end subroutine simpson_2d
end module m_s2d_core
