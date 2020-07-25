import os
import numpy as np
from matplotlib.cbook import get_sample_data
import matplotlib.patches as mpatches
import matplotlib.pyplot as plt
import serpentTools as st

uco = mpatches.Patch(color=(1., 1., 0.), label='UCO')
buffer = mpatches.Patch(color=(1., 0.5, 0.), label='Buffer')
pyc = mpatches.Patch(color=(1., 0., 0.), label='PyC')
sic = mpatches.Patch(color=(0.6, 0.3, 0.), label='SiC')
matrix = mpatches.Patch(color=(0.63, 0.63, 0.63), label='Compact matrix')
block = mpatches.Patch(color=(0.61, 1., 0.91), label='Block graphite')
helium = mpatches.Patch(color=(0.59, 0.41, 1.), label='He')


def standard():
    '''
    Adds legend to standard fuel assembly geometry image:
    'standard-fuel_geom1.png'.
    '''
    cwd = os.getcwd()
    fname = get_sample_data('%s/assembly.png' % (cwd))
    im = plt.imread(fname)
    plt.imshow(im)
    plt.legend(handles=[matrix, block, helium],
               loc="upper left", bbox_to_anchor=(1.0, 1.0), fancybox=True)

    plt.axis('off')

    # p = 1.88
    p = 60
    x = 405
    y = 130
    d1 = p/2/np.tan(np.pi/6)
    d2 = p*np.cos(np.pi/3)
    
    plt.plot([x, x+p], [y, y], 'r-', lw=3)
    plt.plot([x, x+p], [y+2*d1, y+2*d1], 'r-', lw=3)

    plt.plot([x-d2, x], [y+d1, y], 'r-', lw=3)
    plt.plot([x-d2, x], [y+d1, y+2*d1], 'r-', lw=3)

    plt.plot([x+p, x+p+d2], [y, y+d1], 'r-', lw=3)
    plt.plot([x+p, x+p+d2], [y+2*d1, y+d1], 'r-', lw=3)

    plt.savefig("standard", dpi=300, bbox_inches="tight")


def standard2():
    '''
    Adds legend to standard fuel assembly geometry image:
    'standard-fuel_geom1.png'.
    '''
    cwd = os.getcwd()
    fname = get_sample_data('%s/assembly2.png' % (cwd))
    im = plt.imread(fname)

    plt.imshow(im)
    plt.axis('off')

    p = 238
    x = 380
    y = 295

    d1 = p/2/np.tan(np.pi/6)
    d2 = p*np.cos(np.pi/3)
    
    plt.plot([x, x+p], [y, y], 'r-', lw=3)
    plt.plot([x, x+p], [y+2*d1, y+2*d1], 'r-', lw=3)

    plt.plot([x-d2, x], [y+d1, y], 'r-', lw=3)
    plt.plot([x-d2, x], [y+d1, y+2*d1], 'r-', lw=3)

    plt.plot([x+p, x+p+d2], [y, y+d1], 'r-', lw=3)
    plt.plot([x+p, x+p+d2], [y+2*d1, y+d1], 'r-', lw=3)

    plt.savefig("standard2", dpi=300, bbox_inches="tight")


standard2()