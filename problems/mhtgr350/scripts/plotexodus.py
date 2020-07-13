import yt


def plotter(file, p1, p2, save, mode='both'):
    ds = yt.load(file, step=-1)

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
    base = '/home/roberto/projects/moltres/problems/mhtgr350/archive/'

    # 2D-fuel-action
    file = base + 'pseudo-1D-neutronics/2D-fuel-reflec-action.e'
    save = base + 'pseudo-1D-neutronics/2D-fuel-reflec-action-g2'
    plotter(file, [0, 0, 0], [0, 1073, 0], save, 'group2')


if __name__ == "__main__":
    main()
