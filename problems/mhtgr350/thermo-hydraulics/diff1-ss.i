
[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 10
  ny = 10
  xmax = 2
  ymax = 10
  elem_type = QUAD4
[../]

[Variables]
  [./temp]
    order = FIRST
    family = MONOMIAL
    initial_condition = 490
  [../]
[]

[Kernels]
  [./diff]
    type = Diffusion
    variable = temp
  [../]
  [./source]
    type = BodyForce
    variable = temp
    value = 1.
  [../]
[]

[DGKernels]
  [./dg_diff]
    type = DGDiffusion
    variable = temp
    epsilon = -1
    sigma = 6
  [../]
[]

[BCs]
  [./heat_wall]
    boundary = 'right'
    type = DGFunctionDiffusionDirichletBC
    variable = temp
    epsilon = -1
    sigma = 6
    function = dirich
  [../]
[]

[Functions]
  [./dirich]
    type = ParsedFunction
    value = '490'
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

[VectorPostprocessors]
  [./across]
    type = LineValueSampler
    variable = 'temp'
    start_point = '0 5 0'
    end_point = '2 5 0'
    sort_by = x
    num_points = 50
    execute_on = timestep_end
  [../]
[]

[Outputs]
  file_base = 'diff1-ss'
  execute_on = timestep_end
  exodus = true
  csv = true
[]
