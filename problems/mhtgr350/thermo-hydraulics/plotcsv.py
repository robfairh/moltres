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

t = '0002'
file = 'advec7-ss_outer_' + t + '.csv'
save = 'advec7-ss-' + t + '-o'
#plotcsv_frommoose_temp(file, save, 'y')

file = 'advec7-ss_across_' + t + '.csv'
save = 'advec7-ss-' + t + '-a'
#plotcsv_frommoose_temp(file, save, 'x')

name = 'cg-advec4-ss'

file = name + '_center_0002.csv'
save = name + 'A'
plotcsv_frommoose_temp(file, save, 'z')

file = name + '_outer_0002.csv'
save = name + 'B'
plotcsv_frommoose_temp(file, save, 'z')

file = name + '_across_0002.csv'
save = name + 'C'
plotcsv_frommoose_temp(file, save, 'x')