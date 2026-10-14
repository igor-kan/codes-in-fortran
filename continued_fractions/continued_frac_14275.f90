module continued_frac_14275_mod
  implicit none
contains
  real(8) function compute_continued_frac_14275(x)
    real(8),intent(in)::x
    real(8)::a;integer::k
    a=1.0d0
    do k=2,1,-1
      a=dble(k)+x/(merge(a,1.0d0,a/=0.0d0))
    end do
    compute_continued_frac_14275=a
  end function compute_continued_frac_14275
end module continued_frac_14275_mod
