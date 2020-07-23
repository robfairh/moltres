
velocity = 0.5

[Mesh]
  type = GeneratedMesh
  dim = 1
  nx = 100
  xmax = 100
  elem_type = EDGE2
[../]

[Variables]
  [./dens]
    order = CONSTANT
    family = MONOMIAL
  [../]
[]

[Kernels]
  [./source]
    type = BodyForce
    variable = dens
    value = 1.
  [../]
[]

[DGKernels]
  [./dens_adv]
    type = DGConvection
    variable = dens
    velocity = '${velocity} 0 0'
  [../]
[]

[BCs]
  [./fuel_bottoms_looped]
    boundary = 'left'
    type = InflowBC
    variable = dens
    uu = ${velocity}
    vv = 0
    ww = 0
    inlet_conc = 50
  [../]

  [./u_adv]
    type = OutflowBC
    #boundary = 'left right' # If I use this option it is like Inflow/inlet_conc=0
    boundary = 'right'
    variable = dens
    velocity = '${velocity} 0 0'
  [../]
[]

[Executioner]
  type = Steady
  nl_rel_tol = 1e-6
  nl_abs_tol = 1e-5
  solve_type = 'NEWTON'
  petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_linesearch_monitor'
  petsc_options_iname = '-pc_type -sub_pc_type -pc_asm_overlap -sub_ksp_type -snes_linesearch_minlambda'
  petsc_options_value = 'asm      lu           1               preonly       1e-3'
  nl_max_its = 30
  l_max_its = 100
[]

[Preconditioning]
  [./SMP]
    type = SMP
    full = true
  [../]
[]

[Outputs]
  [./out]
    type = Exodus
    file_base = 'advec1-ss'
    execute_on = 'timestep_end'
  [../]
[]