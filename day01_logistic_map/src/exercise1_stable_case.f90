module exercise1
   implicit none

contains
   subroutine stable_case(r,x)
      real, intent(in) :: r,x
      ! real, parameter,intent(in) :: r,x
      integer :: i

      character(len=50) :: filename
      integer :: iostat_val, unit
      character(len=100) :: iostat_msg

      print *, 'r:', r
      print *, 'x:', x
      ! filename = 'data','r_',trim(r),'x_',trim(x),'.csv'
      filename = 'data.csv'
      open (newunit=unit, file=filename, status='replace', action='write', iostat=iostat_val, iomsg=iostat_msg)
      if (iostat_val /= 0) then
         print *, 'Error opening file', iostat_msg, ",", iostat_val
         return
       else 
         write (unit, '(A,",",A)') "n", "x"
      end if

      do i = 1, 100
         x = r*x*(1 - x)
         write (unit, '(G0.5,",",G0.5)') i, x
      end do

      close (unit)
   end subroutine stable_case
end module
