!  xslook.f90
!****************************************************************************
!
!  Subroutine: xslook
!
!  READS AVERAGE FLUXES, MACROSCOPIC CROSS SECTIONS, AND DIFFUSION COEFF.
!
!****************************************************************************
!  AUTHORS: JAVIER ORTENSI - Idaho National Laboratory
!           SONAT SEN      - Idaho National Laboratory
!  DATE:   4/4/2011
!****************************************************************************
!
!  INPUTS:
!          xs_file    temporary unit number to be assigned to the cross
!                      section file
!  OUTPUTS:  
!          xstab derived type container with all 234 neutronic data sets
!
!
subroutine xslook(xs_file,xstab)
implicit none

! derive type - contains start and end groups for scattering profile
type xsdata
    real :: FLUX(26)=0.
	real :: SIGT(26)=0.
	real :: DIFFCO(26)=0.
	real :: NUSIGF(26)=0.
	real :: SIGF(26)=0.
	real :: SCAT0(26,26)=0.
	real :: SCAT1(26,26)=0.
	real :: CHI(26)=0.
end type
 
type scatprofiles
   integer :: start=0,end=0
end type scatprofiles

!***********  variable declaration   ************* 
INTEGER, INTENT(IN) :: xs_file       
INTEGER :: ng, g, iblk,nblk,i,j,cblk
INTEGER :: jhigh, jlow
CHARACTER :: s80*80
type (scatprofiles)::profile(234,26,2)  
type (xsdata),INTENT(OUT) ::xstab(234) 

ng=26     ! number of energy groups
nblk=234  ! number of material regions


!cccccccccccccccccccccccccccccccccccccccccccccccccc
!c    Read statements for OECD MHTGR-350 benchmark 
!cccccccccccccccccccccccccccccccccccccccccccccccccc
open(xs_file,file='OECD-MHTGR350_Simplified.xs', status='old')

do iblk=1,nblk
	read(xs_file,'(A80)') s80   ! read material header
    write(*,'(A80)') s80

	!
    !  read average flux, total X-sec, diffusion coeff, nu*fission X-sec, fission X-sec, and spectrum 
    !
    do g=1,ng 
       read(xs_file,*) i, xstab(iblk)%flux(g),xstab(iblk)%SIGT(g),xstab(iblk)%DIFFCO(g),  &
	   xstab(iblk)%NUSIGF(g),xstab(iblk)%SIGF(g),xstab(iblk)%CHI(g)
    enddo
     
    read(xs_file,'(A80)') s80  ! read profile header
    write(*,'(A80)') s80
    !
    !  for each group g read 1st scattering group g' and last scattering group g' 
    !    
	do g=1,ng
	     read(xs_file,*) profile(iblk,g,1)%start,profile(iblk,g,1)%end,profile(iblk,g,2)%start,profile(iblk,g,2)%end
	enddo
    !
    !  for each group g read scattering cross sections g->g' from 
    !    1st scattering group g' to last scattering group g' 
    !	
    do g=1,ng
		jlow=profile(iblk,g,1)%start
		jhigh=profile(iblk,g,1)%end
		read(xs_file,*) (xstab(iblk)%SCAT0(j,g),j=jlow,jhigh)
	enddo
	do g=1,ng
		jlow=profile(iblk,g,2)%start
		jhigh=profile(iblk,g,2)%end
		read(xs_file,*) (xstab(iblk)%SCAT1(j,g),j=jlow,jhigh)
	enddo
	
	read(xs_file,'(A80,/)') s80
    write(*,'(A80,/)') s80    
enddo
close(xs_file)

return
end subroutine xslook
