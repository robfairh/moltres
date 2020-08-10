[Mesh]
  file = ../msh_files/example4.msh
[../]

[Variables]
  [./temp]
    initial_condition = 600
  [../]
[]

[Kernels]
  [./diff]
    type = Diffusion
    variable = temp
  [../]

 [./temp_advection_coolant]
   type = Convection
   velocity = '0 0 2.174'
   variable = temp
   block = 'coolant'
 [../]
[]

[BCs]
  [./temp_diri_cg]
    boundary = 'coolant_bottom'
    type = DirichletBC
    variable = temp
    value = 600
  [../]

  [./temp_diri_cg2]
    boundary = 'side'
    type = NeumannBC
    variable = temp
    value = 2.836
  [../]
[]

[Executioner]
  type = Transient
  end_time = 1000

  nl_rel_tol = 1e-6
  nl_abs_tol = 1e-6

  solve_type = 'NEWTON'
  petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_linesearch_monitor'
  petsc_options_iname = '-pc_type -pc_factor_shift_type'
  petsc_options_value = 'lu       NONZERO'
  line_search = 'none'

  nl_max_its = 30
  l_max_its = 100

  dtmin = 1e-5
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
  [./temp_coolant]
    type = ElementAverageValue
    variable = temp
    block = 'coolant'
    outputs = 'exodus console'
  [../]
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  [./exodus]
    type = Exodus
    file_base = 'ex08'
    execute_on = 'final'
  [../]
[]

[Debug]
  show_var_residual_norms = true
[]
