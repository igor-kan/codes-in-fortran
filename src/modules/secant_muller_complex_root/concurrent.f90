module m_sec_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_sec_types
    use m_sec_ifc
    use m_sec_core
    implicit none
contains
    subroutine solve_guesses(f, n, x0s, x1s, roots)
        procedure(fn_scalar) :: f
        integer, intent(in) :: n
        real(dp), intent(in) :: x0s(n), x1s(n)
        real(dp), intent(out) :: roots(n)
        type(root_res_t) :: r
        integer :: i
        do i = 1, n
            call solve_secant(f, x0s(i), x1s(i), 1.0e-12_dp, 100, r)
            roots(i) = r%x
        end do
    end subroutine solve_guesses
end module m_sec_conc
