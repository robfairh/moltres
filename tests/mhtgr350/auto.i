#Uses neutronics kernels.
#This case is for the unit-cell without reflector.
#It runs, and gets to k = 1.0.

diri_temp=750

[GlobalParams]
  num_groups = 2
  num_precursor_groups = 8
  use_exp_form = false
  group_fluxes = 'group1 group2'
  #temperature = temp
  sss2_input = true
  pre_concs = 'pre1 pre2 pre3 pre4 pre5 pre6 pre7 pre8'
  account_delayed = false
  temperature = 750
[]

[Variables]
  [./group1]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
    #scaling = 1e-4
  [../]
  [./group2]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
    #scaling = 1e-4
  [../]
  #[./temp]
  #  initial_condition = ${diri_temp}
  #  #scaling = 1e-4
  #[../]
[]

[Mesh]
  file = 'meshes/fuel.msh'
[../]

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

[Kernels]
  #---------------------------------------------------------------------
  # Group 1 Neutronics
  #---------------------------------------------------------------------
  #[./time_group1]
  #  type = NtTimeDerivative
  #  variable = group1
  #  group_number = 1
  #[../]
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
    type = CoupledFissionEigenKernel
    #type = CoupledFissionKernel
    variable = group1
    group_number = 1
    block = 'fuel'
  [../]
  #[./delayed_group1]
  #  type = DelayedNeutronSource
  #  variable = group1
  #  block = 'fuel'
  #  group_number=1
  #[../]

  #---------------------------------------------------------------------
  # Group 2 Neutronics
  #---------------------------------------------------------------------
  #[./time_group2]
  #  type = NtTimeDerivative
  #  variable = group2
  #  group_number = 2
  #[../]
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
    type = CoupledFissionEigenKernel
    #type = CoupledFissionKernel
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
  #[./temp_diffusion]
  #  type = MatDiffusion
  #  diffusivity = 'k'
  #  variable = temp
  #[../]
[]

[BCs]
  [./vacuum_group1]
    type = VacuumConcBC
    boundary = 'fuel_bot fuel_top'
    variable = group1
  [../]
  [./vacuum_group2]
    type = VacuumConcBC
    boundary = 'fuel_bot fuel_top'
    variable = group2
  [../]
  #[./temp_diri_cg]
  #  boundary = 'fuel_bot fuel_top'
  #  type = DirichletBC
  #  value = '${diri_temp}'
  #  variable = temp
  #[../]
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