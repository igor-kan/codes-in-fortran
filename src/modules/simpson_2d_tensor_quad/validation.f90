module m_s2d_val
    use m_s2d_types
    use m_s2d_err
    implicit none
contains
    pure function validate_grid(box) result(c)
        type(box2d_t), intent(in) :: box
        integer :: c
        c = merge(ERR_OK, ERR_DIM, box%nx >= 2 .and. mod(box%nx, 2) == 0 .and. &
            box%ny >= 2 .and. mod(box%ny, 2) == 0)
    end function validate_grid
end module m_s2d_val
