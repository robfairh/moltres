
velocity = 2.657e3  # [cm/s]

[Mesh]
  #file = 2D-coolantZ.msh
  file = 2D-coolant.msh
[../]

[Problem]
  coord_type = RZ
[]

[Variables]
  [./temp]
    order = CONSTANT
    family = MONOMIAL
    initial_condition = 490
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
    #velocity = '0 0 ${velocity}'
    velocity = '0 ${velocity} 0'
  [../]
[]

[BCs]
  [./fuel_bottoms_looped]
    boundary = 'bottom'
    type = TemperatureInflowBC
    variable = temp
    uu = 0
    #vv = 0
    #ww = ${velocity}
    vv = ${velocity}
    ww = 0
    inlet_conc = 490
  [../]
  [./temp_advection_outlet]
    boundary = 'top'
    type = TemperatureOutflowBC
    variable = temp
    #velocity = '0 0 ${velocity}'
    velocity = '0 ${velocity} 0'
  [../]
  [./heat_wall]
    boundary = 'right'
    type = FunctionNeumannBC
    variable = temp
    function = 'heat_flux'
  [../]
[]

[Functions]
  [./heat_flux]
    type = ParsedFunction
    #value = '43.55 * sin( pi/793 * z)'
    value = '43.55 * sin( pi/793 * y)'
  [../]
[]

[Materials]
  [./coolant]
    type = GenericConstantMaterial
    prop_names = 'k cp rho'
    prop_values = '1 5.188e3 4.368e-6' # [] [J/kg/K] [kg/cm3]
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

[VectorPostprocessors]
  [./axial]
    type = LineValueSampler
    variable = 'temp'
    start_point = '0 0 0'
    #end_point = '0 0 793'
    end_point = '0 793 0'
    sort_by = y
    num_points = 200
    execute_on = 'initial final'
    #execute_on = 'timestep_end'
  [../]
[]

[Outputs]
  file_base = 'advec6-tB'
  execute_on = 'initial final'
  #execute_on = 'timestep_end'
  exodus = true
  csv = true
[]