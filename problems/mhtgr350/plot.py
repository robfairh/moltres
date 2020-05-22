import yt


def plotter(file, h1, h2):
    home = "/home/roberto"

    field_label = {('all', 'group1'): r'$\phi_1\ moltres$',
                   ('all', 'group2'): r'$\phi_2\ moltres$'}

    ds = yt.load(home+'/projects/moltres/problems/mhtgr350/'+file+'.e',
                 step=-1)

    plt = yt.LinePlot(ds, [('all', 'group1'), ('all', 'group2')],
                      [1.62812, -0.9399, h1], [1.62812, -0.9399, h2],
                      1000, field_labels=field_label)

    plt.annotate_legend(('all', 'group1'))
    plt.set_x_unit('cm')
    plt.set_xlabel('z (cm)')
    # plt.set_ylabel(r'Fluxes ($\mathrm{10^{13}cm^{-2} s^{-1}}$)')
    plt.set_ylabel('Fluxes')
    plt._setup_plots()
    plt.save(home+'/projects/moltres/problems/mhtgr350/'+file+'.png')


# plotter('unit-cell_exodus', 0, 793)
# plotter('unit-cell-reflec_exodus', 0, 1073)