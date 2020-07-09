
[Variables]
  [./temp]
    order = FIRST
    family = LAGRANGE
  [../]
[]

#[Mesh]
#  file = '../meshes/1D-fuel.msh'
#[../]

[Mesh]
  type = GeneratedMesh
  dim = 1
  nx = 3
  xmax = 100
  elem_type = EDGE2
[../]

[Kernels]
  #[./time]
  #  type = TimeDerivative
  #  variable = temp
  #[../]
  [./diff]
    type = Diffusion
    variable = temp
  [../]
  [./source]
    type = BodyForce
    variable = temp
    value = 1.0
  [../]
[]

[BCs]
  [./vacuum_group1]
    # type = VacuumConcBC
    type = DirichletBC
    value = 0
    # boundary = 'fuel_bot'
    boundary = 'left'
    variable = temp
  [../]
  [./vacuum_group2]
    type = NeumannBC
    value = 0
    # boundary = 'fuel_top'
    boundary = 'right'
    variable = temp
  [../]
[]

[Executioner]
  type = Steady
  solve_type = 'PJFNK'
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  [./exodus]
    type = Exodus
    file_base = '1D-neumann'
  [../]
[]