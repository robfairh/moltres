
velocity = 0.5

[Mesh]
  type = GeneratedMesh
  dim = 1
  nx = 100
  xmax = 100
  elem_type = EDGE2
[../]

[Variables]
  [./dens]
    order = CONSTANT
    family = MONOMIAL
    [./InitialCondition]
      type = FunctionIC
      function = 'initial_func'
    [../]
  [../]
[]

[Kernels]
  [./dens_time_derivative]
    type = TimeDerivative
    variable = dens
  [../]

  # Not sure if this is necessary or not, the solution does not change
  #[./adv_dens]
  #  implicit = false
  #  type = ConservativeAdvection
  #  variable = dens
  #  velocity = '${velocity} 0 0'
  #[../]
[]

[DGKernels]
  [./dens_adv]
    type = DGConvection
    variable = dens
    velocity = '${velocity} 0 0'
  [../]
[]

[BCs]
  [./fuel_bottoms_looped]
    boundary = 'left'
    type = InflowBC
    variable = dens
    uu = ${velocity}
    vv = 0
    ww = 0
    inlet_conc = 100
  [../]
  [./dens_advection_outlet]
    boundary = 'right'
    type = OutflowBC
    variable = dens
    velocity = '${velocity} 0 0'
  [../]
[]

[Functions]
  [./initial_func]
    type = ParsedFunction
    value = '1e2 + 1e1 * sin(3.141592/100 * x)'
  [../]
[]

[Executioner]
  type = Transient
  end_time = 100

  nl_rel_tol = 1e-8
  nl_abs_tol = 1e-8
  scheme = crank-nicolson

  solve_type = 'NEWTON'
  petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_linesearch_monitor'
  petsc_options_iname = '-pc_type -sub_pc_type -pc_asm_overlap -sub_ksp_type -snes_linesearch_minlambda'
  petsc_options_value = 'asm      lu           1               preonly       1e-3'

  [./TimeStepper]
    type = ConstantDT
    dt = 1
  [../]
[]

[Preconditioning]
  [./SMP]
    type = SMP
    full = true
  [../]
[]

[Postprocessors]
  [./dens_fuel]
    type = ElementAverageValue
    variable = dens
    outputs = 'exodus console'
  [../]
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  [./exodus]
    type = Exodus
    file_base = 'advec'
    execute_on = 'timestep_begin'
  [../]
[]