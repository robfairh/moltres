3D-neutronics/
--------------
* 3D-assembly-30deg-reflec.geo:
	- geometry of 1/6 of the fuel assembly.
	- coolant channels don't go through the reflector

* 3D-assembly-30deg-reflecB.geo:
	- geometry of 1/6 of the fuel assembly.
	- coolant channels go through the reflector

* 3D-fullcore-120-homo.geo:
	- 1/3 of the full core geometry.
	- Fuel, coolant, and moderator are an homogeneous mixture.

* 3D-fullcore-60-homo.geo:
	- 1/6 of the full core geometry.
	- Fuel, coolant, and moderator are an homogeneous mixture.


* 3D-assembly-homo-action.i:
	- Transient problem.
	- Defines Nt action instead of kernels.
	- Fuel, moderator, and coolant are homogenized.

* 3D-assembly-30-homo-eig.i:
	- 3D-assembly-30deg-reflec.msh
	- Eigenvalue problem.
	- Fuel, moderator, and coolant are homogenized.

* 3D-fullcore-60-homo-eig.i
	- 3D-fullcore-60-homo.msh
	- Eigenvalue problem

* 3D-fullcore-120-homo.i
	- 3D-fullcore-120-homoA.msh
	- 3D-fullcore-120-homoB.msh
	- 3D-fullcore-120-homoC.msh
	- Transient problem
	- Fuel, moderator, and coolant are homogenized.

* 3D-fullcore-120-homo-bc.i
	- 3D-fullcore-120-homoC.msh
	- Transient problem
	- Fuel, moderator, and coolant are homogenized.
	- Tries adding periodic BCs


benchmark/
----------
* 3D-fullcore-120B.msh:
	- reduced geometry to try continuity between materials
	- this can be deleted eventually

* 120.geo:
	- 1/3rd of the reactor
	* 120A.msh: Lb = 20, Lf = 5, Lt = 20, h = 40
	* 120B.msh: Lb = 30, Lf = 10, Lt = 30, h = 20

* small120.geo
	- reduced geometry for debugging purposes
	- this can be deleted eventually

* define-materials.py:
	- Writes the materials block for the moltres input file of the benchmark


* try1.i: 
	- tries continuity between materials
	- 3D-fullcore-120B.msh
	- solves heat equation
	- can be deleted eventually

* try2.i: 
	- tries continuity between materials
	- 120A.msh
	- solves heat equation
	- can be deleted eventually

* try3.i: 
	- 120A.msh
	- define cross sections for all the materials
	- transient problem
	- it crashes: out of memory
	- try-er is the error thrown on the arfc local

* try3-ss.i:
	- 120A.msh
	- eigenvalue problem
	- define cross sections for all the materials
	- it crashes: out of memory
	- define cross sections for all the materials
	- uses actions

* try3-ss-k.i: 
	- 120A.msh
	- eigenvalue problem
	- define cross sections for all the materials
	- defines kernels individually

* try4.i: 
	- tries continuity between materials
	- 120A.msh
	- solves heat equation
	- tries periodic BCs in wall1 and wall2
	- can be deleted eventually

* try5.i: 
	- small120.msh
	- this is a reduced problem, it works
	- can be deleted eventually
	- Materials: M1, M221, M225, M227, M228


scripts/
--------
* auxiliary.py
	- adds legengs to figures of the geometries

* plotcsv.py
	- paraview reads exodus, exports values to csv, plots those values
	- moose output to csv, plots those values

* plotexodus.py
	- adds legengs to figures of the geometries


thermo-hydraulics/
------------------
* advec1-t.i:
    - 1D
	- Advection equation
	- Advects BC
	- Uses DGKernels
	- Transient problem
	- InflowBC and OutflowBC

* advec1-t-bc.i:
	- 1D
	- Advection equation
	- Uses DGKernels
	- Transient problem
	- Periodic BCs
	- This does not work
	- Periodic BCs do not work for CONSTANT MONOMIAL variables.
	- And DG only works with CONSTANT MONOMIAL variables.

* advec2-ss.i
	- 1D
	- Same as advec2-t but steady state
	- Uses DGKernels
	- Steady-state problem
	- Outflow BC

* advec2-t.i:
    - 1D
	- Advection equation
	- Advects BC
	- Adds a source
	- Uses DGKernels
	- Transient problem
	- InflowBC and OutflowBC

* advec3-t.i:
	- 1D
	- Advection equation for temperature
	- Advects BC
	- Uses DG kernels
	- Transient problem
	- TemperatureInflowBC and TemperatureOutflowBC

* advec4-t.i:
	- 1D
	- Advects temperature from a point source
	- Point source changes over time
	- Uses DG kernels
	- Transient problem

* advec5-t.i:
	- pseudo-1D
	- q'' on one of the walls
	- Uses DG kernels
	- Transient problem


* burguers.i:
	- Burguers equation
	- Uses DGKernels
	- Transient problem
	- Inflow and outflow BCs ??
	- This does not work
	- Need to define the OutflowBC kernel ??


* TH-temp3.i
	- 2D-unitcell

* TH-temp4.i
	- 2D-unitcell-reflec
