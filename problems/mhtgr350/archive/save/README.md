(this files can be eventually eliminated)

* 2D-fuel.i:
	- 2D-fuel.geo
	- Transient problem.

* 2D-fuel-reflec.i:
	- 2D-fuel-reflec.geo
	- Transient problem.

* 2D-fullcore-reflec.i:
	- 2D-fullcoreB.geo
	- Transient problem.

* 2D-unitcell-reflec-action2.i
	- save/2D-unitcell-reflecB.geo
	- Transient problem.
	- Defines NT action instead of kernels.

* 2D-unitcell-reflec-actionB.i
	- save/2D-unitcell-reflecB.geo
	- Transient problem.
	- Defines NT action instead of kernels.
	- Coolant material is replaced by moderator.
	- This input file might be deleted in the future.
	- It is useful to show that the coolant makes the flux smoother.

* TH-temp.i
	- It doesn't work, originally for the 3D-unitcell
	- It uses CG, uses kernels left in roberto-arfc

* TH-temp2.i
	- Same material properties as TH-temp.i
	- Intends to use DG kernels
	- It doesn't work