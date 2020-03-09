inlet_temp=512
outlet_temp=992
average_temp=750

[GlobalParams]
  num_groups = 2
  num_precursor_groups = 8
  use_exp_form = false
  group_fluxes = 'group1 group2'
  sss2_input = true
  pre_concs = 'pre1 pre2 pre3 pre4 pre5 pre6 pre7 pre8'
  account_delayed = false
  temperature = temp
[]

[Variables]
  [./temp]
    initial_condition = ${inlet_temp}
  [../]
[]

[Mesh]
  file = 'meshes/unit-cell-reflec.msh'
[../]

[Kernels]
  [./temp_time_derivative]
    type = MatINSTemperatureTimeDerivative
    variable = temp
  [../]
  #[./temp_advection_fuel]
  #  type = ConservativeTemperatureAdvection
  #  velocity = '0 ${flow_velocity} 0'
  #  variable = temp
  #  block = 'fuel'
  #[../]
  [./temp_diffusion]
    type = MatDiffusion
    diffusivity = 'k'
    variable = temp
  [../]
[]

[BCs]
  [./temp_diri_inlet]
    boundary = 'ref_top cool_top'
    type = DirichletBC
    value = '${inlet_temp}'
    variable = temp
  [../]

  [./temp_diri_outlet]
    boundary = 'ref_bot cool_bot'
    type = DirichletBC
    value = '${outlet_temp}'
    variable = temp
  [../]
[]

[Materials]
  [./fuel]
    type = GenericMoltresMaterial
    property_tables_root = 'xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k rho cp'
    prop_values = '100.0 1.0 1.0'
    block = 'fuel'
  [../]
  [./moderator]
    type = GenericMoltresMaterial
    property_tables_root = 'xs800000-500-100/htgr_2g_moderator_'
    interp_type = 'linear'
    prop_names = 'k rho cp'
    prop_values = '100.0 1.0 1.0'
    block = 'moderator'
  [../]
  [./coolant]
    type = GenericMoltresMaterial
    property_tables_root = 'xs800000-500-100/htgr_2g_coolant_'
    interp_type = 'linear'
    prop_names = 'k rho cp'
    prop_values = '10. 0.1 0.1'
    block = 'coolant'
  [../]
[]

#[Executioner]
#  type = Steady
#  nl_rel_tol = 1e-6
#  nl_abs_tol = 1e-5
#  solve_type = 'NEWTON'
#  petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_linesearch_monitor'
#  petsc_options_iname = '-pc_type -sub_pc_type -pc_asm_overlap -sub_ksp_type -snes_linesearch_minlambda'
#  petsc_options_value = 'asm      lu           1               preonly       1e-3'
#  nl_max_its = 30
#  l_max_its = 100
#[]

[Executioner]
  #automatic_scaling = true
  type = Transient
  end_time = 100
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
    cutback_factor = 0.5
    growth_factor = 1.5
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
    outputs = 'console'
  [../]
  [./temp_moder]
    type = ElementAverageValue
    variable = temp
    block = 'moderator'
    outputs = 'console'
  [../]
  [./temp_cool]
    type = ElementAverageValue
    variable = temp
    block = 'coolant'
    outputs = 'console'
  [../]
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  [./exodus]
    type = Exodus
    file_base = 'temp'
  [../]
[]

[Debug]
  show_var_residual_norms = true
[]