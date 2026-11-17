module m_ch_val
    use m_ch_err
    implicit none
contains
    pure function check_deg(n) result(c)
        integer, intent(in) :: n
        integer :: c
        c = merge(ERR_OK, ERR_DIM, n >= 1)
    end function check_deg
end module m_ch_val
