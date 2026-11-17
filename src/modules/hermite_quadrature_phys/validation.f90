module m_gh_val
    use m_gh_err
    implicit none
contains
    pure function validate_gh_n(n) result(c)
        integer, intent(in) :: n
        integer :: c
        c = merge(ERR_OK, ERR_DIM, n >= 1)
    end function validate_gh_n
end module m_gh_val
