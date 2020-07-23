1D-neutronics/
--------------
* 1D-fuel.geo: 
	- Fuel. 

* 1D-fuel-reflec.geo: 
	- Fuel, bottom, and top reflectors. 
	- Bottom and top reflector are different materials.


* 1D-assembly-eig.i
	- 1D-fuel-reflecA.msh: 265 elements
	- Eigenvalue problem: InversePowerMethod
	- Fuel column cross sections.

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
	- 1D-fuel-reflecA.msh: 265 elements
	- 1D-fuel-reflecB.msh: 1070 elements (this mesh can be deleted eventually)
	- Transient problem.

* 1D-fuel-refleci-eig1.i
	- 1D-fuel-reflec.msh
	- Eigenvalue problem: InversePowerMethod

* 1D-fuel-reflec-eig2.i
	- 1D-fuel-reflec.msh
	- Eigenvalue problem: NonlinearEigen


2D-neutronics/
--------------
* 2D-fullcore-reflec.geo:
	- Full core 2D axisymmetric.
	- Moderator and reflectors are defined as 5 different materials.
	- Reflector does not include coolant holes.

* 2D-fullcore-reflec-homo-action.i:
	- 2D-fullcore-reflec.msh
	- Transient problem.
	- Uses NT action instead of kernels.
	- Uses homogenized cross sections.


3D-neutronics/
--------------
* 3D-assembly-30deg-reflec.geo:
	- geometry of 1/6 of the fuel assembly.
	- coolant channels don't go through the reflector

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





Things to look into: Neutronics
-------------------------------
- I am not sure the eigenvalue calculations are correct

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
(This version is deprecated and will be removed)
[MeshModifiers]
  [./add_side_sets]
    type = SideSetsFromPoints
    points = '0    0  0
              0  793  0'
    new_boundary = 'fuel_bot fuel_top'
  [../]
[]

How to make side sets from nodal sets (points in gmsh):
-------------------------------------------------------
(This is the best way to do it)
[Mesh]
  [mymesh]
    type = FileMeshGenerator
    file = '1D-fuel-reflecA.msh'
  [../]

  [./add_side_sets]
    type = SideSetsFromPointsGenerator
    input = mymesh
    points = '0    0  0
              0  1073  0'
    new_boundary = 'ref_bot ref_top'
  [../]
[../]

How to export to the csv the values of a variable over a line:
--------------------------------------------------------------
[VectorPostprocessors]
  [./tocsv]
    type = LineValueSampler
    variable = 'group1 group2'
    start_point = '0 0 0'
    end_point = '0 1073 0'
    sort_by = y
    num_points = 100
    execute_on = timestep_end
  [../]
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  file_base = '1D-fuel-reflec-eig1'
  execute_on = timestep_end
  exodus = true
  csv = true
[]