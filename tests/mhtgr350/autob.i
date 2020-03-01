#Uses neutronics action.
#This case is for the unit-cell without reflector.
#It runs and blows up ... k=1.43

diri_temp=750

[GlobalParams]
  num_groups = 2
  num_precursor_groups = 8
  use_exp_form = false
  group_fluxes = 'group1 group2'
  temperature = 750
  sss2_input = true
  #pre_concs = 'pre1 pre2 pre3 pre4 pre5 pre6 pre7 pre8'
  account_delayed = false
  #account_delayed = true
[]

[Mesh]
  file = 'meshes/fuel.msh'
[../]

[Nt]
  var_name_base = group
  vacuum_boundaries = 'fuel_bot fuel_top'
  create_temperature_var = false
  #scaling = 1e-4
  pre_blocks = 'fuel'
  eigen = true
[]

#[Precursors]
#  [./pres]
#    var_name_base = pre
#    block = 'fuel'
#    outlet_boundaries = 'fuel_bot'
#    u_def = 0
#    v_def = 0
#    w_def = 0
#    nt_exp_form = false
#    family = MONOMIAL
#    order = CONSTANT
#  [../]
#[]

[Materials]
  [./fuel]
    type = GenericMoltresMaterial
    property_tables_root = 'xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '.0553'
    block = 'fuel'
  [../]
[]

#[Executioner]
#  automatic_scaling = true
#  
#  type = Transient
#  end_time = 100
#  nl_rel_tol = 1e-6
#  nl_abs_tol = 1e-6
#  solve_type = 'NEWTON'
#  petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_linesearch_monitor'
#  petsc_options_iname = '-pc_type -pc_factor_shift_type'
#  petsc_options_value = 'lu       NONZERO'
#  line_search = 'none'
#  nl_max_its = 30
# l_max_its = 100
#  dtmin = 1e-5
#  [./TimeStepper]
#    type = IterationAdaptiveDT
#    dt = 1e-3
#    cutback_factor = 0.4
#    growth_factor = 1.2
#    optimal_iterations = 20
#  [../]
#[]

[Executioner]
  type = InversePowerMethod
  max_power_iterations = 50
  xdiff = 'group1diff'

  bx_norm = 'bnorm'
  k0 = 1.5
  pfactor = 1e-2
  l_max_its = 100

  # solve_type = 'PJFNK'
  solve_type = 'NEWTON'
  petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_linesearch_monitor'
  petsc_options_iname = '-pc_type -sub_pc_type'
  petsc_options_value = 'asm lu'
[]

#[Postprocessors]
#  [./group1_current]
#    type = IntegralNewVariablePostprocessor
#    variable = group1
#    outputs = 'console exodus'
#  [../]
#  [./group1_old]
#    type = IntegralOldVariablePostprocessor
#    variable = group1
#    outputs = 'console exodus'
#  [../]
#  [./multiplication]
#    type = DivisionPostprocessor
#    value1 = group1_current
#    value2 = group1_old
#    outputs = 'console exodus'
#  [../]
#[]

[Postprocessors]
  [./bnorm]
    type = ElmIntegTotFissNtsPostprocessor
    execute_on = linear
  [../]
  [./tot_fissions]
    type = ElmIntegTotFissPostprocessor
    execute_on = linear
  [../]
  [./group1norm]
    type = ElementIntegralVariablePostprocessor
    variable = group1
    execute_on = linear
  [../]
  [./group1max]
    type = NodalMaxValue
    variable = group1
    execute_on = timestep_end
  [../]
  [./group1diff]
    type = ElementL2Diff
    variable = group1
    execute_on = 'linear timestep_end'
    use_displaced_mesh = false
  [../]
  [./group2norm]
    type = ElementIntegralVariablePostprocessor
    variable = group2
    execute_on = linear
  [../]
  [./group2max]
    type = NodalMaxValue
    variable = group2
    execute_on = timestep_end
  [../]
  [./group2diff]
    type = ElementL2Diff
    variable = group2
    execute_on = 'linear timestep_end'
    use_displaced_mesh = false
  [../]
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  [./exodus]
    type = Exodus
    file_base = 'autob'
  [../]
[]

[Debug]
  show_var_residual_norms = true
[]