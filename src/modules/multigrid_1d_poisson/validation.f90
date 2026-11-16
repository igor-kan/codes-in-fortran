module m_mg_val
    use m_mg_err
    implicit none
contains
    pure function validate_dyadic_grid(n) result(code)
        integer, intent(in) :: n
        integer :: code, m
        if (n < 4) then
            code = ERR_DIM
            return
        end if
        m = n
        do while (mod(m, 2) == 0)
            m = m / 2
        end do
        if (m == 1) then
            code = ERR_OK
        else
            code = ERR_DIM
        end if
    end function validate_dyadic_grid
end module m_mg_val
