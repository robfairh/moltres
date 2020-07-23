import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


def plotcsv_frommoose_temp(file, save):
    '''
        Moltres output is a csv file.
        This function plots those values.
    '''
    file = pd.read_csv(file)

    x = file['x'].tolist()
    temp = file['dens'].tolist()

    plt.figure()
    plt.plot(x, temp)
    plt.ylabel('Density')
    plt.xlabel('x [cm]')
    # plt.title('Steady-state flux')
    plt.savefig(save, dpi=300, bbox_inches="tight")


file = 'advec2-t_axial_0251.csv'
save = 'advec2-t-251'
plotcsv_frommoose_temp(file, save)
