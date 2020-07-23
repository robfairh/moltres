
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

  [./source]
    type = BodyForce
    variable = temp
    value = 1.
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
    inlet_conc = 930
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
    prop_values = '.1 2e3 1e-2'
  [../]
[]

[Executioner]
  type = Transient
  end_time = 250

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

#[Postprocessors]
#  [./dens_fuel]
#    type = ElementAverageValue
#    variable = temp
#    outputs = 'exodus console'
#  [../]
#[]

[VectorPostprocessors]
  [./axial]
    type = LineValueSampler
    variable = 'temp'
    start_point = '0 0 0'
    end_point = '100 0 0'
    sort_by = x
    num_points = 200
    # execute_on = 'timestep_end'
    execute_on = 'initial final'
  [../]
[]

[Outputs]
  file_base = 'advec4-t'
  execute_on = 'initial final'
  exodus = true
  csv = true
[]