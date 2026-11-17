module m_ldlt_val
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_ldlt_err
    implicit none
contains
    pure function check_sym(n, a) result(c)
        integer, intent(in) :: n
        real(dp), intent(in) :: a(n, n)
        integer :: c, i, j
        c = ERR_OK
        do i = 1, n
            do j = i + 1, n
                if (abs(a(i, j) - a(j, i)) > 1.0e-12_dp) then
                    c = ERR_DIM
                    return
                end if
            end do
        end do
    end function check_sym
end module m_ldlt_val
