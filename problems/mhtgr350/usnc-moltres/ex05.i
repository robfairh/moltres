[Mesh]
  file = ../msh_files/example2.msh
[../]

[Variables]
  [./temp]
    initial_condition = 600
  [../]
[]

[Kernels]
 [./temp_diffusion]
   type = MatDiffusion
   D_name = 'k'
   variable = temp
 [../]

 [./fuel_time_derivative]
   type = MatINSTemperatureTimeDerivative
   variable = temp
   block = 'fuel'
 [../]
 [./source1]
   type = TempSource
   variable = temp
   src = 10.9
   block = 'fuel'
 [../]

 [./temp_advection_coolant]
   type = MConvection
   velocity = '0 0 10.5'
   variable = temp
   block = 'coolant'
 [../]

 [./moderator_time_derivative]
   type = MatINSTemperatureTimeDerivative
   variable = temp
   block = 'moderator'
 [../]
[]

[BCs]
  [./temp_diri_cg]
    boundary = 'moderator_bottom fuel_bottom coolant_bottom'
    type = DirichletBC
    variable = temp
    value = 600
  [../]

  #[./temp_advection_outlet]
  #  boundary = 'coolant_top'
  #  type = TemperatureOutflowBC
  #  variable = temp
  #  velocity = '0 0 10.5'
  #[../]
[]

[Materials]
  [./fuel]
    type = GenericConstantMaterial
    block = 'fuel'
    prop_names = 'k cp rho'
    prop_values = '10.18 1. 3.84'
  [../]
  [./coolant]
    type = GenericConstantMaterial
    block = 'coolant'
    prop_names = 'k cp rho'
    prop_values = '0.35 5.19 1.'
  [../]
  [./moder]
    type = GenericConstantMaterial
    prop_names = 'k cp rho'
    prop_values = '30.0 1. 2.9'
    block = 'moderator'
  [../]
[]

[Executioner]
  type = Transient
  end_time = 1000

  nl_rel_tol = 1e-6
  nl_abs_tol = 1e-6

  solve_type = 'NEWTON'
  petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_linesearch_monitor'
  petsc_options_iname = '-pc_type -pc_factor_shift_type'
  petsc_options_value = 'lu       NONZERO'
  line_search = 'none'

  nl_max_its = 30
  l_max_its = 100

  dtmin = 1e-5
  [./TimeStepper]
    type = IterationAdaptiveDT
    dt = 1e-3
    cutback_factor = 0.4
    growth_factor = 1.2
    optimal_iterations = 20
  [../]
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
    file_base = 'ex05'
    execute_on = 'final'
  [../]
[]

[Debug]
  show_var_residual_norms = true
[]
