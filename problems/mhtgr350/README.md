1D-neutronics/
--------------
* 1D-fuel.i
	- 1D-fuel.msh
	- Transient problem.

* 1D-fuel-action.i
	- generated mesh in libmesh
	- kernels defined using actions

* 1D-fuel-eig.i
	- 1D-fuel.msh
	- Eigenvalue problem: InversePowerMethod


* 1D-fuel-reflec.i
	- 1D-fuel-reflec.msh
	- Transient problem.

* 1D-fuel-refleci-eig1.i
	- 1D-fuel-reflec.msh
	- Eigenvalue problem: InversePowerMethod

* 1D-fuel-reflec-eig2.i
	- 1D-fuel-reflec.msh
	- Eigenvalue problem: NonlinearEigen



pseudo-1D-neutronics/
---------------------
* 2D-fuel-action.i
	- 2D-fuel.msh
	- Transient problem.
	- Uses NT action instead of kernels.

* 2D-fuel-reflec-action.i
	- 2D-fuel-reflec.msh
	- Transient problem.
	- Uses NT action instead of kernels.

* 2D-fuel-reflec-action-eig.i
	- 2D-fuel-reflec.msh
	- Eigenvalue problem.
	- Uses NT action instead of kernels.


2D-neutronics/
--------------
* 2D-fullcore-reflec-action.i:
	- 2D-fullcore-reflec.msh
	- Transient problem.
	- Uses NT action instead of kernels.

* 2D-fullcore-reflec-actionB.i:
	- 2D-fullcore-reflecB.msh
	- Transient problem.
	- Uses NT action instead of kernels.

* 2D-fullcore-reflec-homo-action.i:
	- 2D-fullcore-reflec.msh
	- Transient problem.
	- Uses NT action instead of kernels.
	- Uses homogenized cross sections.

* 2D-unitcell-reflec-action.i
	- 2D-unitcell-reflec.geo
	- Transient problem.
	- Uses NT action instead of kernels.

* 2D-unitcell-reflec-actionB.i
	- 2D-unitcell-reflecB.geo
	- Transient problem.
	- Uses NT action instead of kernels.

* 2D-unitcell-reflec-homo-action.i
	- 2D-unitcell-reflec.geo
	- Transient problem.
	- Defines NT action instead of kernels.
	- Uses homogenized cross sections

* 2D-unitcell-reflec-homo-action-delayed.i
	- 2D-unitcell-reflec.geo
	- Transient problem.
	- Uses NT and Precursors actions instead of kernels.


3D-neutronics/
--------------
* 3D-assembly-action.i:
	- Transient problem.
	- Defines Nt action instead of kernels.

* 3D-assembly-homo-action.i:
	- Transient problem.
	- Defines Nt action instead of kernels.
	- Fuel, moderator, and coolant are homogenized.

* 3D-fullcore-120-homo.i
	- 3D-fullcore-120-homo.msh
	- 3D-fullcore-120-homoB.msh
	- 3D-fullcore-120-homoC.msh
	- Transient problem
	- Fuel, moderator, and coolant are homogenized.


* 3D-fullcore-120-homo-bc.i
	- 3D-fullcore-120-homoC.msh
	- Transient problem
	- Fuel, moderator, and coolant are homogenized.
	- Tries adding periodic BCs


* 3D-unitcell.i
	- 3D-unitcell.msh
	- Transient problem.
	- Defines Nt action instead of kernels.

* 3D-unitcell-reflec.i:
	- 3D-unitcell-reflec.msh
	- Transient problem.
	- Defines Nt action instead of kernels.


thermo-hydraulics/
------------------
* advec1.i:
    - 1D
	- Advection equation, advects density initial condition out of the domain
	- Uses DGKernels
	- Transient problem
	- Inflow and outflow BCs

* advec1-bc.i:
	- 1D
	- Advection equation, advects density
	- Uses DGKernels
	- Transient problem
	- Periodic BCs
	- This does not work
	- Periodic BCs do not work for CONSTANT MONOMIAL variables.
	- And DG only works with CONSTANT MONOMIAL variables.

* advec1-ss.i
	- 1D
	- Scalar advection equation
	- Uses DGKernels
	- Outflow BC
	- Steady-state problem

* advec2.i:
	- 1D
	- Advects BC
	- Advection equation for temperature
	- Uses DG kernels
	- Transient problem

* advec3.i:
	- 1D
	- Advects temperature from a point source
	- Point source changes over time
	- Uses DG kernels
	- Transient problem

* advec4.i:
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



benchmark/
----------
* 3D-fullcore-120B.msh:
	- reduced geometry to try continuity between materials

* 120.geo:
	- 1/3rd of the reactor

* 120A.msh
	- Lb = 20, Lf = 5, Lt = 20, h = 40

* 120B.msh
	- Lb = 30, Lf = 10, Lt = 30, h = 20

* define-materials.py:
	- Writes the materials block for the moltres input file of the benchmark

* try1.i: 
	- tries continuity between materials
	- 3D-fullcore-120B.msh
	- can be deleted eventually

* try2.i: 
	- tries continuity between materials
	- 120A.msh
	- can be deleted eventually

* try3.i: 
	- 120A.msh
	- define cross sections for all the materials
	- transient problem
	- it crashes for some reason
	- try-er is the error thrown on the arfc local

* try3-ss.i: 
	- 120A.msh
	- eigenvalue problem
	- define cross sections for all the materials

* try3-ss-k.i: 
	- 120A.msh
	- eigenvalue problem
	- define cross sections for all the materials
	- defines kernels individually

* try4.i: 
	- tries continuity between materials
	- 120A.msh
	- tries periodic BCs in wall1 and wall2
	- can be deleted eventually

* try5.i: 
	- small120.msh
	- can be deleted eventually
	- Materials: M1, M221, M225, M227, M228

Scripts:
--------
* define-materials.py

scripts/
--------
* 


save/
-----
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

files that help with the debugging (this files will be eventually deleted):
---------------------------------------------------------------------------
- gdb-output.txt
- input-readme
- material-properties
- nodelayed-fuel.png
- plott.e
- plot-wdelayed-fuel.png
- wdelayed.png

Things to look into: Neutronics
-------------------------------
- Compare reults if I use precursors and delayed neutrons and if I don't ...
- Eigenvalue calculation fails when I have the reflector
- Transient calculation gives garbage when I have the coolant:
	* Homogenize the cross section in the fuel.
	* Meshe shouldn't change
	* Definition of materials in moltres input file will change, different materials will have same XS.

Things to look into: Thermo-hydraulics
--------------------------------------
- Add DGkernel for diffusion to TH-subC.i
- See if the DG kernels work for the steady state case

Things to look into: Thermo-mechanics
-------------------------------------
- Stresses caused by temp gradients:
	* need to solve temp in coolant
	* see if I can solve steady state for the coolant
	* see if I can use a correlation for h
		* Can I solve transient problem now?
- Stresses caused by irradiation
	* need to add kernels that take into account fluence effects
	* take fluence map as input
	* integrate nuetron flux from diffusion
		* flux constant over t, then fluence = flux * t 
		* flux changes as the cross sections change over time

How to define ICs (square function)
-----------------------------------
[Functions]
  [./ic_u]
    type = PiecewiseConstant
    axis = x
    direction = right
    xy_data = '0.1 0.0
               0.6 1.0
               1.0 0.0'
  [../]
[]

[Variables]
  [./u]
    order = FIRST
    family = MONOMIAL
  [../]
[]

[ICs]
  [./u_ic]
    type = FunctionIC
    variable = u
    function = ic_u
  [../]
[]

or

[Variables]
  [./u]
    family = FIRST
    order = CONSTANT
    [./InitialCondition]
      type = FunctionIC
      function = 'ic_u'
    [../]
  [../]
[]

How to generate 1D mesh using libmesh:
--------------------------------------
[Mesh]
  type = GeneratedMesh
  dim = 1
  nx = 100
  xmin = 0
  xmax = 1
[]

How to define periodic BCs:
---------------------------
[BCs]
  [./Periodic]
    #Note: Enable either "auto" or both "manual" conditions for this example
    active = 'manual_x manual_y'

    # Can use auto_direction with Generated Meshes
    [./auto]
      variable = u
      auto_direction = 'x y'
    [../]

     # Use Translation vectors for everything else
     [./manual_x]
       variable = u
       primary = 'left'
       secondary = 'right'
       translation = '40 0 0'
     [../]

     [./manual_y]
       variable = u
       primary = 'bottom'
       secondary = 'top'
       translation = '0 40 0'
     [../]
  [../]
[]

How to make side sets from nodal sets (points in gmsh):
-------------------------------------------------------
[MeshModifiers]
  [./add_side_sets]
    type = SideSetsFromPoints
    points = '0    0  0
              0  793  0'
    new_boundary = 'fuel_bot fuel_top'
  [../]
[]
