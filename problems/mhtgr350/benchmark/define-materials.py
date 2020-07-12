
# Materials definition
f = open("untitled", "w+")
for i in range(1, 233):
    f.write("  [./M" + str(i) + "]\n")
    f.write("    type = GenericMoltresMaterial\n")
    f.write("    property_tables_root = 'xs800000-500-100/htgr_2g_fuel_'\n")
    # f.write("    property_tables_root = '../xs/oecd-nea/oecdxs/htgr_2g_M" + str(i) + "_'\n")
    # f.write("    property_tables_root = 'oecdxs/htgr_2g_M1_'\n")
    # f.write("    property_tables_root = 'oecdxs/htgr_2g_fuel_'\n")
    f.write("    interp_type = 'linear'\n")
    f.write("    prop_names = 'k'\n")
    f.write("    prop_values = '1'\n")
    f.write("    block = 'M" + str(i) + "'\n")
    f.write("  [../]\n")
    f.write("\n")
f.close()

# group_fluxes = 'group1 group2 ... group26'
f = open("untitled2", "w+")
f.write('group1')
for i in range(2, 27):
	f.write(' group' + str(i))
f.close()

# kernel definitions
f = open("untitled3", "w+")

f.write("[Variables]\n")
for i in range(1, 27):
    f.write("  [./group" + str(i) + "]\n")
    f.write("  [../]\n")
f.write("[]\n\n")

f.write("[Kernels]\n")
for i in range(1, 27):
    f.write("  [./diff_group" + str(i) + "]\n")
    f.write("    type = GroupDiffusion\n")
    f.write("    variable = group" + str(i) + "\n")
    f.write("    group_number = " + str(i) + "\n")
    f.write("  [../]\n")
    f.write("  [./sigma_r_group" + str(i) + "]\n")
    f.write("    type = SigmaR\n")
    f.write("    variable = group" + str(i) + "\n")
    f.write("    group_number = " + str(i) + "\n")
    f.write("  [../]\n")
    f.write("  [./inscatter_group" + str(i) + "]\n")
    f.write("    type = InScatter\n")
    f.write("    variable = group" + str(i) + "\n")
    f.write("    group_number = " + str(i) + "\n")
    f.write("  [../]\n")
    f.write("  [./fission_source_group" + str(i) + "]\n")
    f.write("    type = CoupledFissionEigenKernel\n")
    f.write("    variable = group" + str(i) + "\n")
    f.write("    group_number = " + str(i) + "\n")
    f.write("  [../]\n")
f.write("[]\n\n")

f.write("[BCs]\n")
for i in range(1, 27):
    f.write("  [./vacuum_group" + str(i) + "]\n")
    f.write("    type = VacuumConcBC\n")
    f.write("    boundary = 'ref_bot ref_top outerwall'\n")
    f.write("    variable = group" + str(i) + "\n")
    f.write("  [../]\n")
f.write("[]\n\n")

f.close()