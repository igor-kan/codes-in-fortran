module m_ab4_val
    use m_ab4_types
    use m_ab4_err
    implicit none
contains
    pure function check_ab4(cfg) result(c)
        type(ab4_cfg_t), intent(in) :: cfg
        integer :: c
        c = merge(ERR_OK, ERR_DIM, cfg%steps >= 4 .and. cfg%h > 0.0_dp)
    end function check_ab4
end module m_ab4_val
