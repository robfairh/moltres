# Input file for one entire fuel column
# Things to do or modify:
# - material properties
# - auto scaling ?
# - rho * velocity = massflux/A (what A?)
# - uniform temperature

flow_velocity=20.
ini_temp=750
diri_temp=750
nt_scale=1e13

[GlobalParams]
  num_groups = 2
  num_precursor_groups = 8
  use_exp_form = false
  group_fluxes = 'group1 group2'
  temperature = temp
  sss2_input = true
  pre_concs = 'pre1 pre2 pre3 pre4 pre5 pre6 pre7 pre8'
  account_delayed = true
[]

[Variables]
  [./group1]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
    scaling = 1e4
  [../]
  [./group2]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
    scaling = 1e4
  [../]
  [./temp]
    initial_condition = ${ini_temp}
    scaling = 1e-4
  [../]
[]

[Mesh]
  file = 'simplified-noreflector.msh'
[../]

[Precursors]
  [./pres]
    var_name_base = pre
    block = 'fuel'
    outlet_boundaries = 'fuel_bottom'
    u_def = 0
    v_def = 0
    w_def = 0
    nt_exp_form = false
    family = MONOMIAL
    order = CONSTANT
  [../]
[]

[Kernels]
  #---------------------------------------------------------------------
  # Group 1 Neutronics
  #---------------------------------------------------------------------
  [./time_group1]
    type = NtTimeDerivative
    variable = group1
    group_number = 1
  [../]
  [./sigma_r_group1]
    type = SigmaR
    variable = group1
    group_number = 1
  [../]
  [./diff_group1]
    type = GroupDiffusion
    variable = group1
    group_number = 1
  [../]
  [./inscatter_group1]
    type = InScatter
    variable = group1
    group_number = 1
  [../]
  [./fission_source_group1]
    type = CoupledFissionKernel
    variable = group1
    group_number = 1
    block = 'fuel'
  [../]
  [./delayed_group1]
    type = DelayedNeutronSource
    variable = group1
    block = 'fuel'
    group_number=1
  [../]

  #---------------------------------------------------------------------
  # Group 2 Neutronics
  #---------------------------------------------------------------------
  [./time_group2]
    type = NtTimeDerivative
    variable = group2
    group_number = 2
  [../]
  [./sigma_r_group2]
    type = SigmaR
    variable = group2
    group_number = 2
  [../]
  [./diff_group2]
    type = GroupDiffusion
    variable = group2
    group_number = 2
  [../]
  [./fission_source_group2]
    type = CoupledFissionKernel
    variable = group2
    group_number = 2
    block = 'fuel'
  [../]
  [./inscatter_group2]
    type = InScatter
    variable = group2
    group_number = 2
  [../]

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
  [./vacuum_group1]
    type = VacuumConcBC
    boundary = 'fuel_bottom fuel_top coolant_top coolant_bottom moderator_bottom moderator_top'
    variable = group1
  [../]
  [./vacuum_group2]
    type = VacuumConcBC
    boundary = 'fuel_bottom fuel_top coolant_top coolant_bottom moderator_bottom moderator_top'
    variable = group2
  [../]
  #[./temp_advection_outlet]
  #  boundary = 'fuel_bottom coolant_bottom'
  #  type = TemperatureOutflowBC
  #  variable = temp
  #  velocity = '0 ${flow_velocity} 0'
  #[../]
  [./temp_diri_cg]
    boundary = 'fuel_top fuel_bottom coolant_top coolant_bottom moderator_top moderator_bottom'
    type = DirichletBC
    value = '${diri_temp}'
    variable = temp
  [../]
[]

[Materials]
  [./fuel]
    type = GenericMoltresMaterial
    property_tables_root = 'xs200000-2000-200/htgr_2g_fuel_'
    interp_type = 'linear'
    block = 'fuel'
    prop_names = 'k cp'
    prop_values = '.0553 1967'
  [../]
  [./rho_fuel]
    type = DerivativeParsedMaterial
    f_name = rho
    function = '2.146e-3 * exp(-1.8 * 1.18e-4 * (temp - 750))'
    args = 'temp'
    derivative_order = 1
    block = 'fuel'
  [../]
  [./moderator]
    type = GenericMoltresMaterial
    property_tables_root = 'xs200000-2000-200/htgr_2g_moderator_'
    interp_type = 'linear'
    prop_names = 'k cp'
    prop_values = '.312 1760' # Cammi 2011 at 908 K
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
  [./coolant]
    type = GenericMoltresMaterial
    property_tables_root = 'xs200000-2000-200/htgr_2g_coolant_'
    interp_type = 'linear'
    block = 'coolant'
    prop_names = 'k cp'
    prop_values = '.0553 1967'
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
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  [./exodus]
    type = Exodus
    file_base = 'auto'
  [../]
[]

[Debug]
  show_var_residual_norms = true
[]