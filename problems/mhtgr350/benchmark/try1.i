
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
  file = '3D-fullcore-120B.msh'
[../]

[Variables]
  [./temp]
    initial_condition = 0
  [../]
[]

[Kernels]
   #[./time_derivative]
   #  type = MatINSTemperatureTimeDerivative
   #  variable = temp
   #[../]

  [./temp_diffusion]
    type = MatDiffusion
    variable = temp
    D_name = 'k'
  [../]

  [./temp_source]
    type = BodyForce
    variable = temp
    value = 10.
    block = 'M2'
  [../]
[]

[BCs]
  [./temp_diri_cg]
    boundary = 'ref_bot'
    type = DirichletBC
    variable = temp
    value = 0
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
    file_base = 'try1'
  [../]
[]

[Materials]
  [./M221]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M221'
  [../]

  [./M222]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M222'
  [../]

  [./M223]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M223'
  [../]

  [./M224]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M224'
  [../]

  [./M225]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M225'
  [../]

  [./M226]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M226'
  [../]

  [./M227]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M227'
  [../]

  [./M1]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M1'
  [../]

  [./M2]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M2'
  [../]

  [./M3]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M3'
  [../]

  [./M4]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M4'
  [../]

  [./M5]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M5'
  [../]

  [./M6]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M6'
  [../]

  [./M7]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M7'
  [../]

  [./M8]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M8'
  [../]

  [./M9]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M9'
  [../]

  [./M10]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M10'
  [../]

  [./M11]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M11'
  [../]

  [./M12]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M12'
  [../]

  [./M13]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M13'
  [../]

  [./M14]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M14'
  [../]

  [./M15]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M15'
  [../]

  [./M16]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M16'
  [../]

  [./M17]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M17'
  [../]

  [./M18]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M18'
  [../]

  [./M19]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M19'
  [../]

  [./M20]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M20'
  [../]

  [./M21]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M21'
  [../]

  [./M22]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M22'
  [../]

  [./M23]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M23'
  [../]

  [./M24]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M24'
  [../]

  [./M25]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M25'
  [../]

  [./M26]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M26'
  [../]

  [./M27]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M27'
  [../]

  [./M28]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M28'
  [../]

  [./M29]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M29'
  [../]

  [./M30]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M30'
  [../]

  [./M31]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M31'
  [../]

  [./M32]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M32'
  [../]

  [./M33]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M33'
  [../]

  [./M34]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M34'
  [../]

  [./M35]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M35'
  [../]

  [./M36]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M36'
  [../]

  [./M37]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M37'
  [../]

  [./M38]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M38'
  [../]

  [./M39]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M39'
  [../]

  [./M40]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M40'
  [../]

  [./M41]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M41'
  [../]

  [./M42]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M42'
  [../]

  [./M43]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M43'
  [../]

  [./M44]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M44'
  [../]

  [./M45]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M45'
  [../]

  [./M46]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M46'
  [../]

  [./M47]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M47'
  [../]

  [./M48]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M48'
  [../]

  [./M49]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M49'
  [../]

  [./M50]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M50'
  [../]

  [./M51]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M51'
  [../]

  [./M52]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M52'
  [../]

  [./M53]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M53'
  [../]

  [./M54]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M54'
  [../]

  [./M55]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M55'
  [../]

  [./M56]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M56'
  [../]

  [./M57]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M57'
  [../]

  [./M58]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M58'
  [../]

  [./M59]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M59'
  [../]

  [./M60]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M60'
  [../]

  [./M61]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M61'
  [../]

  [./M62]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M62'
  [../]

  [./M63]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M63'
  [../]

  [./M64]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M64'
  [../]

  [./M65]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M65'
  [../]

  [./M66]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M66'
  [../]

[]