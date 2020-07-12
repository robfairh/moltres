import yt
# import matplotlib.pyplot as plt


def plotter(file, p1, p2, save, mode='both'):
    ds = yt.load(file+'.e', step=-1)

    if mode == 'group1':
        vec = [('all', 'group1')]
        field_label = {('all', 'group1'): r'$\phi_1\ moltres$'}

    elif mode == 'group2':
        vec = [('all', 'group2')]
        field_label = {('all', 'group2'): r'$\phi_2\ moltres$'}

    else:
        vec = [('all', 'group1'), ('all', 'group2')]
        field_label = {('all', 'group1'): r'$\phi_1\ moltres$',
                       ('all', 'group2'): r'$\phi_2\ moltres$'}

    plt = yt.LinePlot(ds, vec,
                      [p1[0], p1[1], p1[2]], [p2[0], p2[1], p2[2]],
                      1000, field_labels=field_label)

    plt.annotate_legend(('all', 'group1'))
    plt.set_x_unit('cm')
    plt.set_xlabel('z (cm)')
    # plt.set_ylabel(r'Fluxes ($\mathrm{10^{13}cm^{-2} s^{-1}}$)')
    plt.set_ylabel('Fluxes')
    plt._setup_plots()
    plt.save(save + '.png')
    plt.show()


def main():
    base = '/home/roberto/projects/moltres/problems/mhtgr350/'

    # 3D-unitcell
    file = base + '3D-neutronics/3D-unitcell'
    save = base + '3D-neutronics/3D-unitcell1'
    # Axial flux on the fuel centerline
    x = 1.628
    y = -0.939
    # plotter(file, [x, y, 0], [x, y, 793], save)
    save = base + '3D-neutronics/3D-unitcell2'
    # Axial flux on the coolant centerline
    x = 0
    y = 0
    # plotter(file, [x, y, 0], [x, y, 793], save)

    # 3D-unitcell-reflec
    file = base + '3D-neutronics/3D-unitcell-reflec'
    save = base + '3D-neutronics/3D-unitcell-reflec1'
    # Axial flux on the fuel centerline
    x = 1.628
    y = -0.939
    # plotter(file, [x, y, 0], [x, y, 1073], save)
    save = base + '3D-neutronics/3D-unitcell-reflec2'
    # Axial flux on the coolant centerline
    x = 0
    y = 0
    # plotter(file, [x, y, 0], [x, y, 1073], save)

    # 3D-unitcell-reflec-homo
    file = base + '3D-neutronics/3D-unitcell-reflec-homo'
    save = base + '3D-neutronics/3D-unitcell-reflec-homo'
    # Axial flux 
    x = 0
    y = 0
    plotter(file, [x, y, 0], [x, y, 1073], save)


if __name__ == "__main__":
    main()
