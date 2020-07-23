
velocity = 0.5

[Mesh]
  type = GeneratedMesh
  dim = 1
  nx = 100
  xmax = 100
  elem_type = EDGE2
[../]

[Variables]
  [./temp]
    order = CONSTANT
    family = MONOMIAL
    initial_condition = 930
  [../]
[]

[Kernels]
  [./time_derivative]
    type = MatINSTemperatureTimeDerivative
    variable = temp
  [../]
[]

[DGKernels]
  [./temp_adv]
    type = DGTemperatureAdvection
    variable = temp
    velocity = '${velocity} 0 0'
  [../]
[]

[BCs]
  [./fuel_bottoms_looped]
    boundary = 'left'
    type = TemperatureInflowBC
    variable = temp
    uu = ${velocity}
    vv = 0
    ww = 0
    inlet_conc = 940
  [../]
  [./temp_advection_outlet]
    boundary = 'right'
    type = TemperatureOutflowBC
    variable = temp
    velocity = '${velocity} 0 0'
  [../]
[]

[Materials]
  [./coolant]
    type = GenericConstantMaterial
    prop_names = 'k cp rho'
    prop_values = '.1 1967 1e-2'
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
  [./temp_fuel]
    type = ElementAverageValue
    variable = temp
    outputs = 'exodus console'
  [../]
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  [./exodus]
    type = Exodus
    file_base = 'advec2'
    execute_on = 'timestep_begin'
  [../]
[]