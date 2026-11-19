module m_bary_val
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_bary_err
    implicit none
contains
    pure subroutine check_pos_n(n, st)
        integer, intent(in) :: n
        integer, intent(out) :: st
        if (n <= 0) then
            st = ERR_DIM
        else
            st = ERR_OK
        end if
    end subroutine check_pos_n
end module m_bary_val
