
[GlobalParams]
  num_groups = 26
  num_precursor_groups = 8
  use_exp_form = false
  group_fluxes = 'group1 group2 group3 group4 group5 group6 group7 group8 group9 group10 group11 group12 group13 group14 group15 group16 group17 group18 group19 group20 group21 group22 group23 group24 group25 group26'
  sss2_input = true
  account_delayed = false
  temperature = 750
[]

[Mesh]
  file = 'smmall120.msh'
[../]

[Variables]
  [./temp]
    initial_condition = 0
  [../]
[]

[Nt]
  var_name_base = group
  vacuum_boundaries = 'ref_bot ref_top outerwall'
  create_temperature_var = false
  pre_blocks = 'M1'
  dg_for_temperature = false
[]

#[BCs]
#  [./temp_diri_cg]
#    boundary = 'ref_bot'
#    type = DirichletBC
#    variable = temp
#    value = 0
#  [../]
#[]

[Executioner]
  # automatic_scaling = true

  type = Transient
  end_time = 1e-3

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
    cutback_factor = 0.3
    growth_factor = 1.2
    optimal_iterations = 20
  [../]
  dtmax = 5e-5
[]

[Preconditioning]
  [./SMP]
    type = SMP
    full = true
  [../]
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  [./exodus]
    type = Exodus
    file_base = 'try5'
  [../]
[]

[Materials]
  [./M1]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M1_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M1'
  [../]

  [./M221]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M221_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M221'
  [../]

  [./M225]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M225_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M225'
  [../]

  [./M227]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M227_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M227'
  [../]

  [./M228]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M228_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M228'
  [../]

[]