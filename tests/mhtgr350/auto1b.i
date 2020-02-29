diri_temp=750

[GlobalParams]
  num_groups = 2
  num_precursor_groups = 8
  use_exp_form = false
  group_fluxes = 'group1 group2'
  temperature = temp
  sss2_input = true
  pre_concs = 'pre1 pre2 pre3 pre4 pre5 pre6 pre7 pre8'
  account_delayed = false
[]

[Variables]
  [./temp]
    initial_condition = ${diri_temp}
    scaling = 1e-4
  [../]
[]

[Mesh]
  file = 'meshes/unit-cell-reflec.msh'
[../]

[Nt]
  var_name_base = group
  vacuum_boundaries = 'ref_top ref_bot cool_top cool_bot'
  create_temperature_var = false
  scaling = 1e-4
  pre_blocks = 'fuel'
[]

#[Precursors]
#  [./pres]
#    var_name_base = pre
#    block = 'fuel'
#    outlet_boundaries = 'fuel_top'
#    u_def = 0
#    v_def = 0
#    w_def = 0
#    nt_exp_form = false
#    family = MONOMIAL
#    order = CONSTANT
#  [../]
#[]

[Kernels]
  #---------------------------------------------------------------------
  # Temperature
  #---------------------------------------------------------------------
  [./temp_diffusion]
    type = MatDiffusion
    diffusivity = 'k'
    variable = temp
  [../]
[]

[BCs]
  [./temp_diri_cg]
    boundary = 'ref_top ref_bot cool_top cool_bot'
    type = DirichletBC
    value = '${diri_temp}'
    variable = temp
  [../]
[]

[Materials]
  [./fuel]
    type = GenericMoltresMaterial
    property_tables_root = 'xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '.0553'
    block = 'fuel'
  [../]
  [./moderator]
    type = GenericMoltresMaterial
    property_tables_root = 'xs800000-500-100/htgr_2g_moderator_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '.312'
    block = 'moderator'
  [../]
  [./coolant]
    type = GenericMoltresMaterial
    property_tables_root = 'xs800000-500-100/htgr_2g_coolant_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '.0553'
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
    file_base = 'auto1b'
  [../]
[]

[Debug]
  show_var_residual_norms = true
[]