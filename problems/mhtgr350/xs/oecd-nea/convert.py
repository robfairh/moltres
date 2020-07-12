"""
This script converts the cross sections in 'OECD-MHTGR350_Simplified.xs'
to moltres format.
"""
import numpy as np


def getxs(inFile, index):
    """
    Reads 'OECD-MHTGR350_Simplified.xs' and converts to moltres format.

    Parameters:
    -----------
    inFile: file
        path and name of the file
    """
    with open(inFile, 'r') as i:
        data = i.readlines()
    lines = list()
    for line in data:
        lines.append(line.split())

    i = int(lines.index(['MATERIAL', str(index)]))
    XS = {'FLX': [], 'ST': [], 'DIFFCOEF': [], 'NSF': [], 'FISS': [], 'CHIT': [],
          'SP0': np.zeros((26, 26)), 'SP1': np.zeros((26, 26))}
    for group in lines[i+1:i+27]:
        XS['FLX'].append(group[1])
        XS['ST'].append(group[2])  # Total XS = \Sigma_t
        XS['DIFFCOEF'].append(group[3])
        XS['NSF'].append(group[4])  # \nu \Sigma_f
        XS['FISS'].append(group[5])  # Fission XS = \Sigma_f
        XS['CHIT'].append(group[6])

    # XS['SPO'] is a 26 x 26 matrix:
    # S1-1 S1-2 .... S1-26
    # S2-1 S2-2 .... S2-26
    i += 28
    for g in range(0, 26):
        sp0s = int(lines[i+g][0])-1
        spes = int(lines[i+g][1])-1
        for gp in range(0, spes-sp0s+1):
            XS['SP0'][g, gp+sp0s] = lines[i+g+26][gp]

    for g in range(0, 26):
        sp0s = int(lines[i+g][2])-1
        spes = int(lines[i+g][3])-1
        for gp in range(0, spes-sp0s+1):
            XS['SP1'][g, gp+sp0s] = lines[i+g+26+26][gp]

    return XS


def tomoltresformat(XS, index):
    '''
    '''
    base = 'oecdxs/htgr_2g_M' + str(index) + '_'

    T = 750

    data = ['NSF', 'DIFFCOEF', 'FISS', 'CHIT']
    for param in data:
        f = open(base + param + '.txt', "w+")
        f.write(str(750))
        for dg in XS[param]:
            f.write(' ' + dg )
        f.write('\n')
        f.close()
        # print(param + ' done')

    # SP0 in Moltres for 2 groups: TEMP S11 S12 S21 S22
    # for dg in XS['SP0']:
    #      print(dg)

    f = open(base + 'SP0' + '.txt', "w+")
    f.write(str(750))
    for i in range(len(XS['SP0'])):
        for dg in XS['SP0'][i]:
            f.write(' ' + str(dg))
    f.write('\n')
    f.close()
    # print('SP0 done')

    f = open(base + 'REMXS' + '.txt', "w+")
    f.write(str(750))
    for i in range(len(XS['SP0'])):
        scatii = float(XS['SP0'][i, i])
        toti = float(XS['ST'][i])
        f.write(' ' + str(toti-scatii))
    f.write('\n')
    f.close()
    # print('REMXS done')

    # MeV/fission: 200 MeV/fission
    f = open(base + 'KAPPA' + '.txt', "w+")
    f.write(str(750))
    for i in range(26):
        if index >= 1 and index <= 220:
            f.write(' 200.0')
        else:
            f.write(' 0.0')
    f.write('\n')
    f.close()
    # print('KAPPA done')

    # All the rest, these can be all 0
    data = ['INVV', 'CHID']
    for param in data:
        f = open(base + param + '.txt', "w+")
        f.write(str(750))
        for i in range(26):
            f.write(' 0.0')
        f.write('\n')
        f.close()
        # print(param + ' done')

    # The following is not necessarily true, but in steady state, it shouldn't matter
    # param = 'CHID'
    # f = open(base + param , "w+")
    # f.write(str(750))
    # for dg in XS[param]:
    #     f.write(' ' + dg )
    # f.close()
    # print(param + ' done')

    # 8 is the number of precursor groups
    data = ['BETA_EFF', 'LAMBDA']
    for param in data:
        f = open(base + param + '.txt', "w+")
        f.write(str(750))
        for i in range(8):
            f.write(' 0.0')
        f.write('\n')
        f.close()
        # print(param + ' done')

    print('Material ' + str(index) + ' done')


def main():

    # index = 1
    # XS = getxs('reduced.xs', index)
    # XS = getxs('OECD-MHTGR350_Simplified.xs', index)
    # tomoltresformat(XS, index)

    for index in range(1, 233):
        XS = getxs('OECD-MHTGR350_Simplified.xs', index)
        tomoltresformat(XS, index)


if __name__ == "__main__":
    main()
