module m_ccq_err
    implicit none
    integer, parameter :: ERR_OK = 0
    integer, parameter :: ERR_DIM = 1
    integer, parameter :: ERR_NAN = 2
    integer, parameter :: ERR_NO_CONV = 3
    integer, parameter :: ERR_SINGULAR = 4
contains
    pure function err_message(code) result(msg)
        integer, intent(in) :: code
        character(len=32) :: msg
        select case (code)
        case (ERR_OK)
            msg = 'ok'
        case (ERR_DIM)
            msg = 'invalid dimension'
        case (ERR_NAN)
            msg = 'non-finite floating input'
        case (ERR_NO_CONV)
            msg = 'iteration did not converge'
        case (ERR_SINGULAR)
            msg = 'singular pivot encountered'
        case default
            msg = 'unknown status'
        end select
    end function err_message
end module m_ccq_err
