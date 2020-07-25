
velocity = 2.657e3  # [cm/s]
# velocity = 100  # [cm/s]

[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 4
  ny = 100
  xmax = 1
  ymax = 200
  elem_type = QUAD4
[../]

# [Mesh]
#   file = 2D-coolant.msh
# [../]

# [Problem]
#   coord_type = RZ
# []

[Variables]
  [./temp]
    order = CONSTANT
    # order = FIRST
    family = MONOMIAL
    # family = LAGRANGE
    initial_condition = 490
  [../]
[]

[Kernels]
  [./temp_diffusion]
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

[DGKernels]
  [./temp_adv]
    type = DGTemperatureAdvection
    variable = temp
    velocity = '0 ${velocity} 0'
  [../]

  [./dg_diff]
    type = DGDiffusion
    variable = temp
    epsilon = -1
    sigma = 6
    diff = 'k'
  [../]
[]

[BCs]
  [./fuel_bottoms_looped]
    boundary = 'bottom'
    type = TemperatureInflowBC
    variable = temp
    uu = 0
    vv = ${velocity}
    ww = 0
    inlet_conc = 490
  [../]
  [./temp_advection_outlet]
    boundary = 'top'
    type = TemperatureOutflowBC
    variable = temp
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
    value = '22.24 * sin( pi/200 * y)'
  [../]
[]

[Materials]
  [./coolant]
    type = GenericConstantMaterial
    prop_names = 'k cp rho'
    prop_values = '1 5.188e3 4.368e-6' # [] [J/kg/K] [kg/cm3]
    # prop_values = '2.2e-3 5.188e3 4.368e-6' # [W/cm/K] [J/kg/K] [kg/cm3]
    # k (7 MPa, 490 C) = 0.223 W/m/K = 2.23e-3 W/cm/K
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
    end_point = '0 200 0'
    sort_by = y
    num_points = 100
    execute_on = 'initial final'
    #execute_on = 'timestep_end'
  [../]

  [./outer]
    type = LineValueSampler
    variable = 'temp'
    start_point = '1 0 0'
    end_point = '1 200 0'
    sort_by = y
    num_points = 100
    execute_on = 'initial final'
    #execute_on = 'timestep_end'
  [../]

  [./across]
    type = LineValueSampler
    variable = 'temp'
    start_point = '0 100 0'
    end_point = '1 100 0'
    sort_by = x
    num_points = 10
    execute_on = timestep_end
  [../]
[]

[Outputs]
  file_base = 'advec7-ss'
  execute_on = 'initial final'
  #execute_on = 'timestep_end'
  exodus = true
  csv = true
[]