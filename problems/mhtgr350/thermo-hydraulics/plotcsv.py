import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


def plotcsv_frommoose_temp(file, save):
    '''
        Moltres output is a csv file.
        This function plots those values.
    '''
    file = pd.read_csv(file)

    x = file['y'].tolist()
    temp = file['temp'].tolist()

    plt.figure()
    plt.plot(x, temp)
    plt.ylabel('Temperature')
    plt.xlabel('x [cm]')
    # plt.title('Steady-state flux')
    plt.savefig(save, dpi=300, bbox_inches="tight")


file = 'advec5-t_axial_0000.csv'
save = 'advec5-t-0'
# plotcsv_frommoose_temp(file, save)

file = 'advec5-t_axial_0251.csv'
save = 'advec5-t-251'
plotcsv_frommoose_temp(file, save)
