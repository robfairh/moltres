
[GlobalParams]
  num_groups = 2
  num_precursor_groups = 8
  use_exp_form = false
  group_fluxes = 'group1 group2'
  sss2_input = true 
  account_delayed = false
  temperature = 750
[]

[Variables]
  [./group1]
  [../]
  [./group2]
  [../]
[]

[Mesh]
  file = '3D-fullcore-60-homo.msh'
[../]

[Kernels]
  [./diff_group1]
    type = GroupDiffusion
    variable = group1
    group_number = 1
  [../]
  [./sigma_r_group1]
    type = SigmaR
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
    variable = group1
    group_number = 1
  [../]

  [./diff_group2]
    type = GroupDiffusion
    variable = group2
    group_number = 2
  [../]
  [./sigma_r_group2]
    type = SigmaR
    variable = group2
    group_number = 2
  [../]
  [./inscatter_group2]
    type = InScatter
    variable = group2
    group_number = 2
  [../]
  [./fission_source_group2]
    type = CoupledFissionEigenKernel
    variable = group2
    group_number = 2
  [../]
[]

[BCs]
  [./vacuum_group1]
    type = VacuumConcBC
    boundary = 'ref_bot ref_top wall3'
    variable = group1
  [../]
  [./vacuum_group2]
    type = VacuumConcBC
    boundary = 'ref_bot ref_top wall3'
    variable = group2
  [../]
[]

[Materials]
  [./fuel]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_homoge_'
    interp_type = 'linear'
    block = 'fuel'
  [../]
  [./breflector]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_brefl_'
    interp_type = 'linear'
    block = 'breflector'
  [../]
  [./treflector]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_trefl_'
    interp_type = 'linear'
    block = 'treflector'
  [../]
  [./ireflector]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_irefl_'
    interp_type = 'linear'
    block = 'ireflector'
  [../]
  [./oreflector]
    type = GenericMoltresMaterial
    property_tables_root = '../xs/8/xs800000-500-100/htgr_2g_orefl_'
    interp_type = 'linear'
    block = 'oreflector'
  [../]
[]

[Executioner]
  type = InversePowerMethod
  max_power_iterations = 100
  xdiff = 'group1diff'

  bx_norm = 'bnorm'
  k0 = 1.4
  pfactor = 1e-4
  l_max_its = 300

  eig_check_tol = 1e-08

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
  [./bnorm]
    type = ElmIntegTotFissNtsPostprocessor
    execute_on = linear
  [../]
  [./group1diff]
    type = ElementL2Diff
    variable = group1
    execute_on = 'linear timestep_end'
    use_displaced_mesh = false
  [../]
[]

[VectorPostprocessors]
  [./axial1]
    type = LineValueSampler
    variable = 'group1 group2'
    start_point = '85 55 0'
    end_point = '85 55 1073'
    sort_by = z
    num_points = 300
    execute_on = timestep_end
  [../]
  [./axial3]
    type = LineValueSampler
    variable = 'group1 group2'
    start_point = '130 80 0'
    end_point = '130 80 1073'
    sort_by = z
    num_points = 300
    execute_on = timestep_end
  [../]
  [./radial1]
    type = LineValueSampler
    variable = 'group1 group2'
    start_point = '0 0 400'
    end_point = '259 149 400'
    sort_by = x
    num_points = 300
    execute_on = timestep_end
  [../]
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  file_base = '3D-fullcore-60-homo-eig'
  execute_on = timestep_end
  exodus = true
  csv = true
[]

[Debug]
  show_var_residual_norms = true
[]