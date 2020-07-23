* advec4-tB.i:
	- 1D
	- Advects temperature from a point source
	- Point source changes over time
	- Uses DG kernels
	- Transient problem
	- Dirac Heat Exchanger

* TH-temp.i
	- It doesn't work, originally for the 3D-unitcell
	- It uses CG, uses kernels left in roberto-arfc

* TH-temp2.i
	- Same material properties as TH-temp.i
	- Intends to use DG kernels
	- It doesn't work