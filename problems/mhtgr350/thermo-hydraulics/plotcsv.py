import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


def plotcsv_frommoose_temp(file, save, dire='x'):
    '''
        Moltres output is a csv file.
        This function plots those values.
    '''
    file = pd.read_csv(file)

    x = file[dire].tolist()
    temp = file['temp'].tolist()

    plt.figure()
    plt.plot(x, temp)
    plt.ylabel('Temperature')
    plt.xlabel(dire + ' [cm]')
    # plt.title('Steady-state flux')
    plt.savefig(save, dpi=300, bbox_inches="tight")


# file = 'advec7-t_center_0251.csv'
# save = 'advec7-t-251-c'
# plotcsv_frommoose_temp(file, save)

file = 'advec7-t_outer_0101.csv'
save = 'advec7-t-101-o'
# plotcsv_frommoose_temp(file, save, 'y')

file = 'advec7-t_across_0011.csv'
save = 'advec7-t-251-a'
# plotcsv_frommoose_temp(file, save, 'x')

file = 'diff1-ss_across_0001.csv'
save = 'diff1-ss_across'
# plotcsv_frommoose_temp(file, save, 'x')

file = 'advec6-ss_axial_0002.csv'
save = 'advec6-ss'
plotcsv_frommoose_temp(file, save, 'y')