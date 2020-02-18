flow_velocity=20.      # cm/s. See MSRE-properties.ods
ini_temp=750
diri_temp=750
nt_scale=1e13

[GlobalParams]
  temperature = temp
[]

[Variables]
  [./temp]
    initial_condition = ${ini_temp}
    scaling = 1e-4
  [../]
[]

[Mesh]
  file = 'meshes/unit-cell-reflecb.msh'
[../]

[Kernels]
  #---------------------------------------------------------------------
  # Temperature
  #---------------------------------------------------------------------
  #[./temp_time_derivative]
  #  type = MatINSTemperatureTimeDerivative
  #  variable = temp
  #[../]
  #[./temp_advection_fuel]
  #  type = ConservativeTemperatureAdvection
  #  velocity = '0 ${flow_velocity} 0'
  #  variable = temp
  #  block = 'fuel'
  #[../]
  #[./temp_advection_coolant]
  #  type = ConservativeTemperatureAdvection
  #  velocity = '0 ${flow_velocity} 0'
  #  variable = temp
  #  block = 'coolant'
  #[../]
  [./temp_diffusion]
    type = MatDiffusion
    diffusivity = 'k'
    variable = temp
  [../]
  #[./temp_source_fuel]
  #  type = TransientFissionHeatSource
  #  variable = temp
  #  nt_scale=${nt_scale}
  #  block = 'fuel'
  #[../]
  #[./temp_source_coolant]
  #  type = TransientFissionHeatSource
  #  variable = temp
  #  nt_scale=${nt_scale}
  #  block = 'coolant'
  #[../]
[]

[BCs]
  #[./temp_advection_outlet]
  #  boundary = 'fuel_bottom coolant_bottom'
  #  type = TemperatureOutflowBC
  #  variable = temp
  #  velocity = '0 ${flow_velocity} 0'
  #[../]
  [./temp_diri_cg1]
    boundary = 'cool_bot'
    type = DirichletBC
    value = '750'
    variable = temp
  [../]
  [./temp_diri_cg2]
    boundary = 'cool_top'
    type = DirichletBC
    value = '900'
    variable = temp
  [../]

[]

[Materials]
  [./fuel]
    type = GenericConstantMaterial
    prop_names = 'k cp'
    prop_values = '.0553 1967'
    block = 'fuel'
  [../]
  [./rho_fuel]
    type = DerivativeParsedMaterial
    f_name = rho
    function = '2.146e-3 * exp(-1.8 * 1.18e-4 * (temp - 750))'
    args = 'temp'
    derivative_order = 1
    block = 'fuel'
  [../]

  [./mdoerator]
    type = GenericConstantMaterial
    prop_names = 'k cp'
    prop_values = '.312 1760'
    block = 'moderator'
  [../]
  [./rho_moder]
    type = DerivativeParsedMaterial
    f_name = rho
    function = '1.86e-3 * exp(-1.8 * 1.0e-5 * (temp - 750))'
    args = 'temp'
    derivative_order = 1
    block = 'moderator'
  [../]
  
  [./coolant3]
    type = GenericConstantMaterial
    prop_names = 'k cp'
    prop_values = '.0553 1967'
    block = 'coolant'
  [../]
  [./rho_cool]
    type = DerivativeParsedMaterial
    f_name = rho
    function = '2.146e-3 * exp(-1.8 * 1.18e-4 * (temp - 750))'
    args = 'temp'
    derivative_order = 1
    block = 'coolant'
  [../]
[]

[Executioner]
  type = Transient
  end_time = 100

  nl_rel_tol = 1e-6
  nl_abs_tol = 1e-6

  solve_type = 'NEWTON'
  petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_linesearch_monitor'
  petsc_options_iname = '-pc_type -pc_factor_shift_type'
  petsc_options_value = 'lu       NONZERO'
  line_search = 'none'
   # petsc_options_iname = '-snes_type'
  # petsc_options_value = 'test'

  nl_max_its = 30
  l_max_its = 100

  dtmin = 1e-5
  # dtmax = 1
  # dt = 1e-3
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
  [./temp_moder]
    type = ElementAverageValue
    variable = temp
    block = 'moderator'
    outputs = 'exodus console'
  [../]
  [./temp_cool]
    type = ElementAverageValue
    variable = temp
    block = 'coolant'
    outputs = 'exodus console'
  [../]
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  [./exodus]
    type = Exodus
    file_base = 'auto2'
    #execute_on = 'final'
  [../]
[]

[Debug]
  show_var_residual_norms = true
[]