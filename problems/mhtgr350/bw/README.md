try3-ss:

  solve_type = 'PJFNK'
  petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_linesearch_monitor'
  petsc_options_iname = '-pc_type -sub_pc_type'
  petsc_options_value = 'asm lu'

[Preconditioning]
  [./SMP]
    type = SMP
    full = true
  [../]
[]

try3-ss-a:

  solve_type = 'PJFNK'
  petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_linesearch_monitor'
  petsc_options_iname = '-pc_type -sub_pc_type'
  petsc_options_value = 'asm lu'

[Preconditioning]
  [./SMP]
    type = SMP
    full = false
  [../]
[]
