module m_cgf_err
    implicit none
    integer, parameter :: ERR_OK = 0
    integer, parameter :: ERR_DIM = 1
    integer, parameter :: ERR_NAN = 2
    integer, parameter :: ERR_CONV = 3
    integer, parameter :: ERR_SING = 4
contains
    pure function f90_err_text(code) result(msg)
        integer, intent(in) :: code
        character(len=32) :: msg
        select case (code)
        case (ERR_OK)
            msg = 'ok'
        case (ERR_DIM)
            msg = 'invalid dimension'
        case (ERR_NAN)
            msg = 'non-finite float input'
        case (ERR_CONV)
            msg = 'did not converge'
        case (ERR_SING)
            msg = 'singular pivot encountered'
        case default
            msg = 'unknown code'
        end select
    end function f90_err_text
end module m_cgf_err
