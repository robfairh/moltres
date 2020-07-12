
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
  file = '120A.msh'
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

# Polar to Cartesian
# R = sqrt(x^2 + y^2)
# x = R * cos(theta)
# y = R * sin(theta)
[Functions]
  [./tr_x]
    type = ParsedFunction
    value = sqrt(x^2+y^2)*cos(pi/2)
  [../]

  [./tr_y]
    type = ParsedFunction
    value = sqrt(x^2+y^2)*sin(pi/2)
  [../]

  [./tr_z]
    type = ParsedFunction
    value = z
  [../]

  [./itr_x]
    type = ParsedFunction
    value = sqrt(x^2+y^2)*cos(-pi/6)
  [../]

  [./itr_y]
    type = ParsedFunction
    value = sqrt(x^2+y^2)*sin(-pi/6)
  [../]

  [./itr_z]
    type = ParsedFunction
    value = z
  [../]
[]

[BCs]
  [./temp_diri_cg]
    boundary = 'ref_bot outerwall'
    type = DirichletBC
    variable = temp
    value = 0
  [../]

  [./Periodic]
    [./x]
      primary = 'wall2'
      secondary = 'wall1'
      transform_func = 'tr_x tr_y tr_z'
      inv_transform_func = 'itr_x itr_y itr_z'
    [../]
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
    file_base = 'try4'
  [../]
[]

[Materials]
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

  [./M67]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M67'
  [../]

  [./M68]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M68'
  [../]

  [./M69]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M69'
  [../]

  [./M70]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M70'
  [../]

  [./M71]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M71'
  [../]

  [./M72]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M72'
  [../]

  [./M73]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M73'
  [../]

  [./M74]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M74'
  [../]

  [./M75]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M75'
  [../]

  [./M76]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M76'
  [../]

  [./M77]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M77'
  [../]

  [./M78]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M78'
  [../]

  [./M79]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M79'
  [../]

  [./M80]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M80'
  [../]

  [./M81]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M81'
  [../]

  [./M82]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M82'
  [../]

  [./M83]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M83'
  [../]

  [./M84]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M84'
  [../]

  [./M85]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M85'
  [../]

  [./M86]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M86'
  [../]

  [./M87]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M87'
  [../]

  [./M88]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M88'
  [../]

  [./M89]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M89'
  [../]

  [./M90]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M90'
  [../]

  [./M91]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M91'
  [../]

  [./M92]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M92'
  [../]

  [./M93]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M93'
  [../]

  [./M94]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M94'
  [../]

  [./M95]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M95'
  [../]

  [./M96]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M96'
  [../]

  [./M97]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M97'
  [../]

  [./M98]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M98'
  [../]

  [./M99]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M99'
  [../]

  [./M100]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M100'
  [../]

  [./M101]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M101'
  [../]

  [./M102]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M102'
  [../]

  [./M103]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M103'
  [../]

  [./M104]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M104'
  [../]

  [./M105]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M105'
  [../]

  [./M106]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M106'
  [../]

  [./M107]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M107'
  [../]

  [./M108]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M108'
  [../]

  [./M109]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M109'
  [../]

  [./M110]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M110'
  [../]

  [./M111]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M111'
  [../]

  [./M112]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M112'
  [../]

  [./M113]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M113'
  [../]

  [./M114]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M114'
  [../]

  [./M115]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M115'
  [../]

  [./M116]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M116'
  [../]

  [./M117]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M117'
  [../]

  [./M118]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M118'
  [../]

  [./M119]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M119'
  [../]

  [./M120]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M120'
  [../]

  [./M121]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M121'
  [../]

  [./M122]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M122'
  [../]

  [./M123]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M123'
  [../]

  [./M124]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M124'
  [../]

  [./M125]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M125'
  [../]

  [./M126]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M126'
  [../]

  [./M127]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M127'
  [../]

  [./M128]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M128'
  [../]

  [./M129]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M129'
  [../]

  [./M130]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M130'
  [../]

  [./M131]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M131'
  [../]

  [./M132]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M132'
  [../]

  [./M133]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M133'
  [../]

  [./M134]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M134'
  [../]

  [./M135]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M135'
  [../]

  [./M136]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M136'
  [../]

  [./M137]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M137'
  [../]

  [./M138]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M138'
  [../]

  [./M139]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M139'
  [../]

  [./M140]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M140'
  [../]

  [./M141]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M141'
  [../]

  [./M142]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M142'
  [../]

  [./M143]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M143'
  [../]

  [./M144]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M144'
  [../]

  [./M145]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M145'
  [../]

  [./M146]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M146'
  [../]

  [./M147]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M147'
  [../]

  [./M148]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M148'
  [../]

  [./M149]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M149'
  [../]

  [./M150]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M150'
  [../]

  [./M151]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M151'
  [../]

  [./M152]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M152'
  [../]

  [./M153]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M153'
  [../]

  [./M154]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M154'
  [../]

  [./M155]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M155'
  [../]

  [./M156]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M156'
  [../]

  [./M157]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M157'
  [../]

  [./M158]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M158'
  [../]

  [./M159]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M159'
  [../]

  [./M160]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M160'
  [../]

  [./M161]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M161'
  [../]

  [./M162]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M162'
  [../]

  [./M163]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M163'
  [../]

  [./M164]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M164'
  [../]

  [./M165]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M165'
  [../]

  [./M166]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M166'
  [../]

  [./M167]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M167'
  [../]

  [./M168]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M168'
  [../]

  [./M169]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M169'
  [../]

  [./M170]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M170'
  [../]

  [./M171]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M171'
  [../]

  [./M172]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M172'
  [../]

  [./M173]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M173'
  [../]

  [./M174]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M174'
  [../]

  [./M175]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M175'
  [../]

  [./M176]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M176'
  [../]

  [./M177]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M177'
  [../]

  [./M178]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M178'
  [../]

  [./M179]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M179'
  [../]

  [./M180]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M180'
  [../]

  [./M181]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M181'
  [../]

  [./M182]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M182'
  [../]

  [./M183]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M183'
  [../]

  [./M184]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M184'
  [../]

  [./M185]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M185'
  [../]

  [./M186]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M186'
  [../]

  [./M187]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M187'
  [../]

  [./M188]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M188'
  [../]

  [./M189]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M189'
  [../]

  [./M190]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M190'
  [../]

  [./M191]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M191'
  [../]

  [./M192]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M192'
  [../]

  [./M193]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M193'
  [../]

  [./M194]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M194'
  [../]

  [./M195]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M195'
  [../]

  [./M196]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M196'
  [../]

  [./M197]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M197'
  [../]

  [./M198]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M198'
  [../]

  [./M199]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M199'
  [../]

  [./M200]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M200'
  [../]

  [./M201]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M201'
  [../]

  [./M202]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M202'
  [../]

  [./M203]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M203'
  [../]

  [./M204]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M204'
  [../]

  [./M205]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M205'
  [../]

  [./M206]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M206'
  [../]

  [./M207]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M207'
  [../]

  [./M208]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M208'
  [../]

  [./M209]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M209'
  [../]

  [./M210]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M210'
  [../]

  [./M211]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M211'
  [../]

  [./M212]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M212'
  [../]

  [./M213]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M213'
  [../]

  [./M214]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M214'
  [../]

  [./M215]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M215'
  [../]

  [./M216]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M216'
  [../]

  [./M217]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M217'
  [../]

  [./M218]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M218'
  [../]

  [./M219]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M219'
  [../]

  [./M220]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M220'
  [../]

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

  [./M228]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M228'
  [../]

  [./M229]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M229'
  [../]

  [./M230]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M230'
  [../]

  [./M231]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M231'
  [../]

  [./M232]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_fuel_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M232'
  [../]
[]