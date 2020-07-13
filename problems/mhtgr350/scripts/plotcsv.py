import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


def plotcsv_fromparaview(file, save):
    '''
        Moltres output is an exodus file.
        Paraview reads exodus file.
        Paraview exports values to csv.
        This function plots those values.
    '''
    file = pd.read_csv(file)

    x = file['Points:1'].tolist()
    group1 = file['group1'].tolist()
    group2 = file['group2'].tolist()

    plt.figure()
    plt.plot(x, group1, label='group1')
    plt.plot(x, group2, label='group2')
    plt.legend(loc='upper right')
    plt.ylabel('Flux')
    plt.xlabel('z [cm]')
    # plt.title('Steady-state flux')
    plt.savefig(save, dpi=300, bbox_inches="tight")


def plotcsv_fromparaview2(file, save):
    '''
        Moltres output is an exodus file.
        Paraview reads exodus file.
        Paraview exports values to csv.
        This function plots those values.
    '''
    file = pd.read_csv(file)

    x = file['Points:1'].tolist()
    temp = file['temp'].tolist()

    plt.figure()
    plt.plot(x, temp)
    plt.ylabel('Temperature')
    plt.xlabel('z [cm]')
    # plt.title('Steady-state flux')
    plt.savefig(save, dpi=300, bbox_inches="tight")


def plotcsv_frommoose(file, save):
    '''
        Moltres output is a csv file.
        This function plots those values.
    '''
    file = pd.read_csv(file)

    x = file['y'].tolist()
    group1 = np.array(file['group1'].tolist())
    group2 = np.array(file['group2'].tolist())

    M = max(group1)
    # group1 /= M
    # group2 /= M

    plt.figure()
    plt.plot(x, group1, label='group1')
    plt.plot(x, group2, label='group2')
    plt.legend(loc='upper right')
    plt.ylabel('Flux')
    plt.xlabel('z [cm]')
    # plt.title('Steady-state flux')
    plt.savefig(save, dpi=300, bbox_inches="tight")


def plotcsv_frommoose2(file, save):
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
    plt.xlabel('z [cm]')
    # plt.title('Steady-state flux')
    plt.savefig(save, dpi=300, bbox_inches="tight")


file = '../1D-neutronics/1D-fuel-reflec-eig1-frompara.csv'
save = '../1D-neutronics/1D-fuel-reflec-eig1_frompara'
# plotcsv_fromparaview(file, save)
file = '../1D-neutronics/1D-fuel-reflec-eig1_tocsv_0001.csv'
save = '../1D-neutronics/1D-fuel-reflec-eig1C'
# plotcsv_frommoose(file, save)
# file = '../try2_frompara.csv'
file = '../try2_tocsv_0001.csv'
save = '../try2'
# plotcsv_fromparaview2(file, save)
# plotcsv_frommoose2(file, save)
file = '../1D-fuel-reflec-eig1_tocsv_0001.csv'
save = '../1D-fuel-reflec-eig1C'
plotcsv_frommoose(file, save)