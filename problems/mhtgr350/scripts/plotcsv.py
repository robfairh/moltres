import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


def plotcsv_fromparaview_groups(file, save):
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
    plt.savefig(save, dpi=300, bbox_inches="tight")


def plotcsv_fromparaview_temp(file, save):
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
    plt.savefig(save, dpi=300, bbox_inches="tight")


def plotcsv_frommoose_groups_Z(file, save):
    '''
        Moltres output is a csv file.
        This function plots those values.
    '''
    file = pd.read_csv(file)

    x = file['y'].tolist()
    group1 = file['group1'].tolist()
    group2 = file['group2'].tolist()

    # If values are unsorted
    # group1 = [X for _,X in sorted(zip(x,group1))]
    # group2 = [X for _,X in sorted(zip(x,group2))]
    # x.sort()

    group1 = np.array(group1)
    group2 = np.array(group2)

    M = max(group1)
    group1 /= M
    group2 /= M

    plt.figure()
    plt.plot(x, group1, label='group1')
    plt.plot(x, group2, label='group2')
    plt.legend(loc='upper right')
    plt.ylabel('Flux')
    plt.xlabel('z [cm]')
    plt.savefig(save, dpi=300, bbox_inches="tight")


def plotcsv_frommoose_groups_R(file, save):
    '''
        Moltres output is a csv file.
        This function plots those values.
    '''
    file = pd.read_csv(file)

    x = np.array(file['x'].tolist())
    y = np.array(file['y'].tolist())
    r = np.sqrt(x**2 + y**2)

    group1 = file['group1'].tolist()
    group2 = file['group2'].tolist()

    group1 = np.array(group1)
    group2 = np.array(group2)

    M = max(group1)
    group1 /= M
    group2 /= M

    plt.figure()
    plt.plot(x, group1, label='group1')
    plt.plot(x, group2, label='group2')
    plt.legend(loc='upper right')
    plt.ylabel('Flux')
    plt.xlabel('z [cm]')
    plt.savefig(save, dpi=300, bbox_inches="tight")


def plotcsv_frommoose_temp(file, save):
    '''
        Moltres output is a csv file.
        This function plots those values.
    '''
    file = pd.read_csv(file)

    x = file['y'].tolist()
    temp = file['group1'].tolist()

    plt.figure()
    plt.plot(x, temp)
    plt.ylabel('Temperature')
    plt.xlabel('z [cm]')
    # plt.title('Steady-state flux')
    plt.savefig(save, dpi=300, bbox_inches="tight")


def plotconvergence(file, save):
    '''
        This function plots eigenvalues vs power iteraions
    '''
    file = pd.read_csv(file)

    x = file['iteration'].tolist()
    eig = file['eigenvalue'].tolist()
    sold = file['solution_difference'].tolist()

    fig, ax1 = plt.subplots()
    ax1.plot(x[1:], eig[1:], marker='o', color='black')
    ax1.set_ylabel("Eigenvalue", color='black')
    ax1.set_xlabel("Iteration")
    ax1.tick_params(axis='y', labelcolor='black')
    ax2 = ax1.twinx()
    ax2.plot(x[1:], sold[1:], color='red', marker='o')
    ax2.set_ylabel(r'$\phi_1-\phi_{1,prev}$', color='red')
    ax2.tick_params(axis='y', labelcolor='red')
    fig.tight_layout()
    plt.savefig(save, dpi=300, bbox_inches="tight")


file = '../1D-neutronics/1D-fuel-reflec-eig1_tocsv_0001.csv'
save = '../1D-neutronics/1D-fuel-reflec-eig1C'
plotcsv_frommoose_groups_Z(file, save)

file = '../1D-fuel-reflec-eig1_tocsv_0001.csv'
save = '../1D-fuel'
# plotcsv_frommoose_groups_Z(file, save)

file = '../1D-eig1.csv'
save = '../1D-eig'
# plotconvergence(file, save)