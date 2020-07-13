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


def plotcsv_frommoose(file, save):
    '''
        Moltres output is a csv file.
        This function plots those values.
    '''
    file = pd.read_csv(file)

    x = file['y'].tolist()
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


file = '../1D-neutronics/1D-fuel-reflec-eig1-frompara.csv'
save = '../1D-neutronics/1D-fuel-reflec-eig1_frompara'
# plotcsv_fromparaview(file, save):
file = '../1D-neutronics/1D-fuel-reflec-eig1_tocsv_0001.csv'
save = '../1D-neutronics/1D-fuel-reflec-eig1B'
plotcsv_frommoose(file, save)
