vel = -1

[GlobalParams]
  num_groups = 2
  num_precursor_groups = 8
  use_exp_form = false
  group_fluxes = 'group1 group2'
  sss2_input = true
  account_delayed = false
  temperature = temp
[]

[Mesh]
  file = 'meshes/2D-unitcell-reflecB.msh'
[../]

[Variables]
  [./temp]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[Kernels]
  [./temp_advection_fuel]
    type = ConservativeTemperatureAdvection
    variable = temp
    velocity = '0 ${vel} 0'
    block = 'coolant'
  [../]
  [./temp_diffusion]
    type = MatDiffusion
    variable = temp
    D_name = 'k'
    #block = 'fuel'
  [../]
  [./temp_source_fuel]
    type = BodyForce
    variable = temp
    # function = heat_source
    value = 5e-3
    block = 'fuel'
  [../]
[]

[Functions]
  [./heat_source]
    type = ParsedFunction
    # value = '3.59 * sin( 3.141592/793 * y)' # W/cm^3
    value = '1.7e-3 * sin( 3.141592/793 * y)' # W/cm^3
  [../]
[]

[BCs]
  [./temp_diri_inlet]
    boundary = 'cool_top'
    type = DirichletBC
    variable = temp
    value = 259
  [../]

  [./temp_advection_outlet]
    boundary = 'cool_bot'
    type = TemperatureOutflowBC
    variable = temp
    velocity = '0 ${vel} 0'
  [../]
[]

[Materials]
  [./fuel]
    type = GenericMoltresMaterial
    property_tables_root = 'xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'rho cp k'
    prop_values = '2.1822 1.217 0.20' #[g/cm^3][J/g/K][W/cm/K]
    block = 'fuel'
  [../]
  [./moderator]
    type = GenericMoltresMaterial
    property_tables_root = 'xs/8/xs800000-500-100/htgr_2g_moderator_'
    interp_type = 'linear'
    prop_names = 'rho cp k'
    prop_values = '1.85 1.5198 0.66' #[g/cm^3][J/g/K][W/cm/K]
    block = 'moderator'
  [../]
  [./coolant]
    type = GenericMoltresMaterial
    property_tables_root = 'xs/8/xs800000-500-100/htgr_2g_coolant_'
    interp_type = 'linear'
    prop_names = 'rho cp k'
    prop_values = '5.07e-3 5.188 0.002357' #[g/cm^3][J/g/K][W/cm/K] values for Tinlet
    block = 'coolant'
  [../]
  [./breflector]
    type = GenericMoltresMaterial
    property_tables_root = 'xs/8/xs800000-500-100/htgr_2g_moderator_'
    interp_type = 'linear'
    prop_names = 'rho cp k'
    prop_values = '1.85 1.5198 0.66' #[g/cm^3][J/g/K][W/cm/K]
    block = 'breflector'
  [../]
  [./treflector]
    type = GenericMoltresMaterial
    property_tables_root = 'xs/8/xs800000-500-100/htgr_2g_moderator_'
    interp_type = 'linear'
    prop_names = 'rho cp k'
    prop_values = '1.85 1.5198 0.66' #[g/cm^3][J/g/K][W/cm/K]
    block = 'treflector'
  [../]
[]

[Executioner]
  type = Steady
  nl_rel_tol = 1e-6
  nl_abs_tol = 1e-5
  solve_type = 'NEWTON'
  petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_linesearch_monitor'
  petsc_options_iname = '-pc_type -sub_pc_type -pc_asm_overlap -sub_ksp_type -snes_linesearch_minlambda'
  petsc_options_value = 'asm      lu           1               preonly       1e-3'
  nl_max_its = 30
  l_max_its = 100
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
    file_base = 'TH-temp4'
  [../]
[]

[Debug]
  show_var_residual_norms = true
[]