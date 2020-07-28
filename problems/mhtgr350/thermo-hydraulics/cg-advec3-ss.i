
velocity = 2.657e3  # [cm/s]

[Mesh]
  file = 3D-coolant.msh
[../]

[Variables]
  [./temp]
    order = FIRST
    family = LAGRANGE
    initial_condition = 490
  [../]
[]

[Kernels]
  [./advection]
    type = ConservativeTemperatureAdvection
    velocity = '0 0 ${velocity}'
    variable = temp
    # upwinding_type = full
  [../]
  [./diffusion]
    type = MatDiffusion
    diffusivity = 'k'
    variable = temp
  [../]
  [./source]
    type = BodyForce
    variable = temp
    value = 0
  [../]
[]

[BCs]
  [./fuel_bottoms_looped]
    boundary = 'bottom'
    type = TemperatureInflowBC
    variable = temp
    uu = 0
    vv = 0
    ww = ${velocity}
    inlet_conc = 490
  [../]
  [./temp_advection_outlet]
    boundary = 'top'
    type = TemperatureOutflowBC
    variable = temp
    velocity = '0 0 ${velocity}'
  [../]
  [./heat_wall]
    boundary = 'wall'
    type = FunctionNeumannBC
    variable = temp
    function = 'heat_flux'
  [../]
[]

[Functions]
  [./heat_flux]
    type = ParsedFunction
    value = '22.24 * sin(pi/793 * z)'
  [../]
[]

[Materials]
  [./coolant]
    type = GenericConstantMaterial
    prop_names = 'k cp rho'
    #prop_values = '2.23e-3 5.188e3 4.368e-6' # [W/cm/K] [J/kg/K] [kg/cm3]
    #prop_values = '1e3 5.188e3 4.368e-6' # [W/cm/K] [J/kg/K] [kg/cm3]
    prop_values = '1e3 5.188e3 4.368e-6' # [W/cm/K] [J/kg/K] [kg/cm3]
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
  [./center]
    type = LineValueSampler
    variable = 'temp'
    start_point = '0 0 0'
    end_point = '0 0 793'
    sort_by = z
    num_points = 100
    execute_on = final
  [../]

  [./outer]
    type = LineValueSampler
    variable = 'temp'
    start_point = '0.794 0 0'
    end_point = '0.794 0 793'
    sort_by = z
    num_points = 100
    execute_on = final
  [../]

  [./across]
    type = LineValueSampler
    variable = 'temp'
    start_point = '0 0 400'
    end_point = '0.794 0 400'
    sort_by = x
    num_points = 10
    execute_on = final
  [../]
[]

[Outputs]
  file_base = 'cg-advec3-ss'
  execute_on = 'final'
  exodus = true
  csv = true
[]