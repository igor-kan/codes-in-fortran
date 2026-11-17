module m_s2d_conc
    use, intrinsic :: iso_fortran_env, only: dp => real64
    use m_s2d_types
    use m_s2d_ifc
    use m_s2d_core
    implicit none
contains
    subroutine refine_pair(box, f, v_coarse, v_fine)
        type(box2d_t), intent(in) :: box
        procedure(fn_2d) :: f
        real(dp), intent(out) :: v_coarse, v_fine
        type(box2d_t) :: b2
        integer :: st1, st2
        b2 = box; b2%nx = box%nx * 2; b2%ny = box%ny * 2
        call simpson_2d(box, f, v_coarse, st1)
        call simpson_2d(b2, f, v_fine, st2)
    end subroutine refine_pair
end module m_s2d_conc
