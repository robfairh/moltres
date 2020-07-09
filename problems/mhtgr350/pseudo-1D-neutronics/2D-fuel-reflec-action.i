
[GlobalParams]
  num_groups = 2
  num_precursor_groups = 8
  use_exp_form = false
  sss2_input = true
  account_delayed = false
  temperature = 750
[]

[Mesh]
  file = '../meshes/2D-fuel-reflec.msh'
[../]

[Nt]
  var_name_base = group
  vacuum_boundaries = 'ref_bot ref_top'
  create_temperature_var = false
  pre_blocks = 'fuel'
  dg_for_temperature = false
[]

[Materials]
  [./fuel]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/1/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    block = 'fuel'
  [../]
  [./breflector]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/1/xs800000-500-100/htgr_2g_moderator_'
    interp_type = 'linear'
    block = 'breflector'
  [../]
  [./treflector]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/1/xs800000-500-100/htgr_2g_moderator_'
    interp_type = 'linear'
    block = 'treflector'
  [../]
[]

[Executioner]
  # automatic_scaling = true

  type = Transient
  end_time = 1e-2

  nl_rel_tol = 1e-6
  nl_abs_tol = 1e-6

  solve_type = 'NEWTON'
  petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_linesearch_monitor'
  petsc_options_iname = '-pc_type -pc_factor_shift_type'
  petsc_options_value = 'lu       NONZERO'
  line_search = 'none'

  nl_max_its = 30
  l_max_its = 100

  dtmin = 1e-6
  [./TimeStepper]
    type = IterationAdaptiveDT
    dt = 1e-6
    cutback_factor = 0.5
    growth_factor = 1.5
    optimal_iterations = 20
  [../]
  dtmax = 1e-4
[]

[Preconditioning]
  [./SMP]
    type = SMP
    full = true
  [../]
[]

[Postprocessors]
  [./group1_current]
    type = IntegralNewVariablePostprocessor
    variable = group1
    outputs = 'console exodus'
  [../]
  [./group1_old]
    type = IntegralOldVariablePostprocessor
    variable = group1
    outputs = 'console exodus'
  [../]
  [./multiplication]
    type = DivisionPostprocessor
    value1 = group1_current
    value2 = group1_old
    outputs = 'console exodus'
  [../]

  [./group1max]
    type = NodalMaxValue
    variable = group1
    execute_on = timestep_end
  [../]
  [./group2max]
    type = NodalMaxValue
    variable = group2
    execute_on = timestep_end
  [../]
  [./S1]
    type = DivisionPostprocessor
    value1 = group2max
    value2 = group1max
    outputs = 'console exodus'
  [../]
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  [./exodus]
    type = Exodus
    file_base = '2D-fuel-reflec-action'
  [../]
[]

[Debug]
  show_var_residual_norms = true
[]