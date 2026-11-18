module m_ms4_err
    implicit none
    integer, parameter :: ERR_OK = 0
    integer, parameter :: ERR_DIM = 1
    integer, parameter :: ERR_NAN = 2
    integer, parameter :: ERR_CONV = 3
contains
    pure function err_label(c) result(lbl)
        integer, intent(in) :: c
        character(len=16) :: lbl
        if (c == ERR_OK) then
            lbl = 'OK'
        else
            lbl = 'ERR'
        end if
    end function err_label
end module m_ms4_err
