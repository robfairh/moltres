
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
  file = '120A.msh'
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
    file_base = 'try3'
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

  [./M2]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M2_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M2'
  [../]

  [./M3]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M3_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M3'
  [../]

  [./M4]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M4_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M4'
  [../]

  [./M5]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M5_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M5'
  [../]

  [./M6]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M6_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M6'
  [../]

  [./M7]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M7_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M7'
  [../]

  [./M8]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M8_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M8'
  [../]

  [./M9]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M9_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M9'
  [../]

  [./M10]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M10_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M10'
  [../]

  [./M11]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M11_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M11'
  [../]

  [./M12]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M12_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M12'
  [../]

  [./M13]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M13_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M13'
  [../]

  [./M14]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M14_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M14'
  [../]

  [./M15]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M15_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M15'
  [../]

  [./M16]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M16_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M16'
  [../]

  [./M17]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M17_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M17'
  [../]

  [./M18]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M18_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M18'
  [../]

  [./M19]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M19_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M19'
  [../]

  [./M20]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M20_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M20'
  [../]

  [./M21]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M21_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M21'
  [../]

  [./M22]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M22_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M22'
  [../]

  [./M23]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M23_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M23'
  [../]

  [./M24]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M24_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M24'
  [../]

  [./M25]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M25_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M25'
  [../]

  [./M26]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M26_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M26'
  [../]

  [./M27]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M27_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M27'
  [../]

  [./M28]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M28_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M28'
  [../]

  [./M29]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M29_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M29'
  [../]

  [./M30]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M30_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M30'
  [../]

  [./M31]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M31_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M31'
  [../]

  [./M32]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M32_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M32'
  [../]

  [./M33]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M33_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M33'
  [../]

  [./M34]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M34_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M34'
  [../]

  [./M35]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M35_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M35'
  [../]

  [./M36]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M36_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M36'
  [../]

  [./M37]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M37_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M37'
  [../]

  [./M38]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M38_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M38'
  [../]

  [./M39]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M39_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M39'
  [../]

  [./M40]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M40_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M40'
  [../]

  [./M41]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M41_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M41'
  [../]

  [./M42]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M42_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M42'
  [../]

  [./M43]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M43_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M43'
  [../]

  [./M44]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M44_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M44'
  [../]

  [./M45]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M45_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M45'
  [../]

  [./M46]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M46_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M46'
  [../]

  [./M47]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M47_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M47'
  [../]

  [./M48]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M48_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M48'
  [../]

  [./M49]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M49_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M49'
  [../]

  [./M50]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M50_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M50'
  [../]

  [./M51]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M51_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M51'
  [../]

  [./M52]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M52_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M52'
  [../]

  [./M53]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M53_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M53'
  [../]

  [./M54]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M54_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M54'
  [../]

  [./M55]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M55_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M55'
  [../]

  [./M56]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M56_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M56'
  [../]

  [./M57]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M57_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M57'
  [../]

  [./M58]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M58_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M58'
  [../]

  [./M59]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M59_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M59'
  [../]

  [./M60]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M60_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M60'
  [../]

  [./M61]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M61_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M61'
  [../]

  [./M62]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M62_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M62'
  [../]

  [./M63]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M63_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M63'
  [../]

  [./M64]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M64_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M64'
  [../]

  [./M65]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M65_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M65'
  [../]

  [./M66]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M66_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M66'
  [../]

  [./M67]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M67_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M67'
  [../]

  [./M68]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M68_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M68'
  [../]

  [./M69]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M69_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M69'
  [../]

  [./M70]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M70_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M70'
  [../]

  [./M71]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M71_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M71'
  [../]

  [./M72]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M72_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M72'
  [../]

  [./M73]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M73_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M73'
  [../]

  [./M74]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M74_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M74'
  [../]

  [./M75]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M75_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M75'
  [../]

  [./M76]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M76_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M76'
  [../]

  [./M77]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M77_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M77'
  [../]

  [./M78]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M78_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M78'
  [../]

  [./M79]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M79_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M79'
  [../]

  [./M80]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M80_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M80'
  [../]

  [./M81]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M81_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M81'
  [../]

  [./M82]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M82_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M82'
  [../]

  [./M83]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M83_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M83'
  [../]

  [./M84]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M84_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M84'
  [../]

  [./M85]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M85_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M85'
  [../]

  [./M86]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M86_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M86'
  [../]

  [./M87]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M87_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M87'
  [../]

  [./M88]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M88_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M88'
  [../]

  [./M89]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M89_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M89'
  [../]

  [./M90]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M90_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M90'
  [../]

  [./M91]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M91_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M91'
  [../]

  [./M92]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M92_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M92'
  [../]

  [./M93]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M93_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M93'
  [../]

  [./M94]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M94_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M94'
  [../]

  [./M95]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M95_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M95'
  [../]

  [./M96]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M96_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M96'
  [../]

  [./M97]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M97_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M97'
  [../]

  [./M98]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M98_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M98'
  [../]

  [./M99]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M99_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M99'
  [../]

  [./M100]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M100_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M100'
  [../]

  [./M101]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M101_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M101'
  [../]

  [./M102]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M102_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M102'
  [../]

  [./M103]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M103_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M103'
  [../]

  [./M104]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M104_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M104'
  [../]

  [./M105]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M105_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M105'
  [../]

  [./M106]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M106_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M106'
  [../]

  [./M107]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M107_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M107'
  [../]

  [./M108]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M108_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M108'
  [../]

  [./M109]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M109_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M109'
  [../]

  [./M110]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M110_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M110'
  [../]

  [./M111]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M111_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M111'
  [../]

  [./M112]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M112_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M112'
  [../]

  [./M113]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M113_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M113'
  [../]

  [./M114]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M114_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M114'
  [../]

  [./M115]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M115_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M115'
  [../]

  [./M116]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M116_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M116'
  [../]

  [./M117]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M117_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M117'
  [../]

  [./M118]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M118_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M118'
  [../]

  [./M119]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M119_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M119'
  [../]

  [./M120]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M120_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M120'
  [../]

  [./M121]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M121_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M121'
  [../]

  [./M122]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M122_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M122'
  [../]

  [./M123]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M123_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M123'
  [../]

  [./M124]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M124_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M124'
  [../]

  [./M125]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M125_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M125'
  [../]

  [./M126]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M126_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M126'
  [../]

  [./M127]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M127_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M127'
  [../]

  [./M128]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M128_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M128'
  [../]

  [./M129]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M129_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M129'
  [../]

  [./M130]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M130_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M130'
  [../]

  [./M131]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M131_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M131'
  [../]

  [./M132]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M132_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M132'
  [../]

  [./M133]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M133_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M133'
  [../]

  [./M134]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M134_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M134'
  [../]

  [./M135]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M135_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M135'
  [../]

  [./M136]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M136_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M136'
  [../]

  [./M137]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M137_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M137'
  [../]

  [./M138]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M138_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M138'
  [../]

  [./M139]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M139_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M139'
  [../]

  [./M140]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M140_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M140'
  [../]

  [./M141]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M141_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M141'
  [../]

  [./M142]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M142_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M142'
  [../]

  [./M143]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M143_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M143'
  [../]

  [./M144]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M144_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M144'
  [../]

  [./M145]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M145_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M145'
  [../]

  [./M146]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M146_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M146'
  [../]

  [./M147]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M147_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M147'
  [../]

  [./M148]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M148_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M148'
  [../]

  [./M149]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M149_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M149'
  [../]

  [./M150]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M150_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M150'
  [../]

  [./M151]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M151_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M151'
  [../]

  [./M152]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M152_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M152'
  [../]

  [./M153]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M153_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M153'
  [../]

  [./M154]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M154_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M154'
  [../]

  [./M155]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M155_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M155'
  [../]

  [./M156]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M156_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M156'
  [../]

  [./M157]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M157_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M157'
  [../]

  [./M158]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M158_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M158'
  [../]

  [./M159]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M159_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M159'
  [../]

  [./M160]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M160_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M160'
  [../]

  [./M161]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M161_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M161'
  [../]

  [./M162]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M162_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M162'
  [../]

  [./M163]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M163_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M163'
  [../]

  [./M164]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M164_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M164'
  [../]

  [./M165]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M165_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M165'
  [../]

  [./M166]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M166_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M166'
  [../]

  [./M167]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M167_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M167'
  [../]

  [./M168]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M168_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M168'
  [../]

  [./M169]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M169_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M169'
  [../]

  [./M170]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M170_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M170'
  [../]

  [./M171]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M171_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M171'
  [../]

  [./M172]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M172_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M172'
  [../]

  [./M173]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M173_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M173'
  [../]

  [./M174]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M174_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M174'
  [../]

  [./M175]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M175_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M175'
  [../]

  [./M176]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M176_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M176'
  [../]

  [./M177]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M177_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M177'
  [../]

  [./M178]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M178_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M178'
  [../]

  [./M179]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M179_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M179'
  [../]

  [./M180]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M180_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M180'
  [../]

  [./M181]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M181_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M181'
  [../]

  [./M182]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M182_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M182'
  [../]

  [./M183]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M183_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M183'
  [../]

  [./M184]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M184_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M184'
  [../]

  [./M185]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M185_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M185'
  [../]

  [./M186]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M186_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M186'
  [../]

  [./M187]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M187_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M187'
  [../]

  [./M188]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M188_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M188'
  [../]

  [./M189]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M189_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M189'
  [../]

  [./M190]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M190_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M190'
  [../]

  [./M191]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M191_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M191'
  [../]

  [./M192]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M192_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M192'
  [../]

  [./M193]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M193_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M193'
  [../]

  [./M194]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M194_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M194'
  [../]

  [./M195]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M195_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M195'
  [../]

  [./M196]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M196_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M196'
  [../]

  [./M197]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M197_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M197'
  [../]

  [./M198]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M198_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M198'
  [../]

  [./M199]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M199_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M199'
  [../]

  [./M200]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M200_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M200'
  [../]

  [./M201]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M201_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M201'
  [../]

  [./M202]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M202_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M202'
  [../]

  [./M203]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M203_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M203'
  [../]

  [./M204]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M204_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M204'
  [../]

  [./M205]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M205_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M205'
  [../]

  [./M206]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M206_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M206'
  [../]

  [./M207]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M207_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M207'
  [../]

  [./M208]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M208_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M208'
  [../]

  [./M209]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M209_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M209'
  [../]

  [./M210]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M210_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M210'
  [../]

  [./M211]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M211_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M211'
  [../]

  [./M212]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M212_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M212'
  [../]

  [./M213]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M213_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M213'
  [../]

  [./M214]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M214_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M214'
  [../]

  [./M215]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M215_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M215'
  [../]

  [./M216]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M216_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M216'
  [../]

  [./M217]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M217_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M217'
  [../]

  [./M218]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M218_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M218'
  [../]

  [./M219]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M219_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M219'
  [../]

  [./M220]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M220_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M220'
  [../]

  [./M221]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M221_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M221'
  [../]

  [./M222]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M222_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M222'
  [../]

  [./M223]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M223_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M223'
  [../]

  [./M224]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M224_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M224'
  [../]

  [./M225]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M225_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M225'
  [../]

  [./M226]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M226_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M226'
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

  [./M229]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M229_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M229'
  [../]

  [./M230]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M230_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M230'
  [../]

  [./M231]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M231_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M231'
  [../]

  [./M232]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M232_'
    interp_type = 'linear'
    prop_names = 'k'
    prop_values = '1'
    block = 'M232'
  [../]

[]