flow_velocity=0.0089

[Mesh]
  file = 'meshes/2D-unitcell.msh'
[../]

[Variables]
  [./temp]
    order = FIRST
    family = LAGRANGE
    #initial_condition = 400
  [../]
[]

[Kernels]
 [./temp_diffusion]
   type = MatDiffusion
   D_name = 'k'
   variable = temp
 [../]

 [./source1]
   type = BodyForce
   variable = temp
   value = 31
   block = 'fuel'
 [../]

 [./temp_advection_coolant]
   type = ConservativeTemperatureAdvection
   velocity = '0 ${flow_velocity} 0'
   variable = temp
   block = 'coolant'
 [../]
[]

[BCs]
  [./temp_diri_cg]
    boundary = 'cool_bot'
    type = DirichletBC
    variable = temp
    value = 400
  [../]

  [./temp_advection_outlet]
    boundary = 'cool_top'
    type = TemperatureOutflowBC
    variable = temp
    velocity = '0 ${flow_velocity} 0'
  [../]
[]

[Materials]
  [./fuel]
    type = GenericConstantMaterial
    prop_names = 'k cp rho'
    prop_values = '0.07 1. 3.84'
    block = 'fuel'
  [../]
  [./moder]
    type = GenericConstantMaterial
    prop_names = 'k cp rho'
    prop_values = '0.3 1.0 2.9'
    block = 'moderator'
  [../]
  [./coolant]
    type = GenericConstantMaterial
    prop_names = 'k cp rho'
    prop_values = '0.0035 5.19e3 1.0'
    block = 'coolant'
  [../]
[]

[Executioner]
  type = Steady
  solve_type = 'NEWTON'

  nl_rel_tol = 1e-6
  nl_abs_tol = 1e-6

  petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_linesearch_monitor'
  petsc_options_iname = '-pc_type -pc_factor_shift_type'
  petsc_options_value = 'lu       NONZERO'
  line_search = 'none'

  nl_max_its = 30
  l_max_its = 100
[]

[Preconditioning]
  [./SMP]
    type = SMP
    full = true
  [../]
[]

[Postprocessors]
  [./temp_fuel]
    type = ElementAverageValue
    variable = temp
    block = 'fuel'
    outputs = 'exodus console'
  [../]
  [./temp_coolant]
    type = ElementAverageValue
    variable = temp
    block = 'coolant'
    outputs = 'exodus console'
  [../]
  [./temp_moder]
    type = ElementAverageValue
    variable = temp
    block = 'moderator'
    outputs = 'exodus console'
  [../]
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  [./exodus]
    type = Exodus
    file_base = 'GTMHR-ss'
  [../]
[]

[Debug]
  show_var_residual_norms = true
[]
