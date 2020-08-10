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
   velocity = '0 0 155.7'
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
    value = 6.8125
  [../]
[]

[Executioner]
  type = Steady
  solve_type = 'PJFNK'
[]

[Outputs]
  execute_on = 'timestep_end'
  exodus = true
[]