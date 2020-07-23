# Advects the density initial condition outside of the domain
# Courant = 0.5

velocity = 10

[Mesh]
  type = GeneratedMesh
  dim = 1
  nx = 50
  xmax = 100
  elem_type = EDGE2
[../]

[Variables]
  [./velx]
    family = MONOMIAL
    order = CONSTANT
    # initial_condition = 100
    [./InitialCondition]
      type = FunctionIC
      function = 'initial_func'
    [../]
  [../]
[]

[Kernels]
  [./dens_time_derivative]
    type = TimeDerivative
    variable = velx
  [../]
[]

[DGKernels]
  [./dens_adv]
    type = DGCoupledAdvection
    variable = velx
    uvel = velx
  [../]
[]

[BCs]
  [./fuel_bottoms_looped]
    boundary = 'left'
    type = InflowBC
    variable = velx
    uu = ${velocity}
    vv = 0
    ww = 0
    inlet_conc = ${velocity}
  [../]

  #[./dens_advection_outlet]
  #  boundary = 'right'
  #  type = CoupledScalarAdvectionNoBCBC
  #  variable = velx
  #  u = velx
  #  # velocity = '${velocity} 0 0' # I believe this is wrong, this should be velx
  #[../]

  [./dens_advection_outlet]
    boundary = 'right'
    type = OutflowBC
    variable = velx
    velocity = velx
  [../]
[]

[Functions]
  [./initial_func]
    type = ParsedFunction
    value = '1e1 + sin(3.141592/100 * x)'
  [../]
[]

[Executioner]
  type = Transient
  end_time = 10

  nl_rel_tol = 1e-8
  nl_abs_tol = 1e-8
  scheme = crank-nicolson

  solve_type = 'NEWTON'
  petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_linesearch_monitor'
  petsc_options_iname = '-pc_type -sub_pc_type -pc_asm_overlap -sub_ksp_type -snes_linesearch_minlambda'
  petsc_options_value = 'asm      lu           1               preonly       1e-3'

  [./TimeStepper]
    type = ConstantDT
    dt = 0.1
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
    variable = velx
    outputs = 'exodus console'
  [../]
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  [./exodus]
    type = Exodus
    file_base = 'burguers'
    execute_on = 'timestep_begin'
  [../]
[]