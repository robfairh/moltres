import os
from matplotlib.cbook import get_sample_data
import matplotlib.patches as mpatches
import matplotlib.pyplot as plt


def geo_label():
    '''
    Adds legend to '2D-fullcore-reflec'.
    '''
    fuel = mpatches.Patch(color=(0.87, 0.87, 0.87), label='Fuel')
    cool = mpatches.Patch(color=(0, 1., 0.), label='Coolant')
    mod = mpatches.Patch(color=(1., 0., 0.), label='Moderator')
    oref = mpatches.Patch(color=(0.9, 0.9, 0.0), label='Outer reflector')
    iref = mpatches.Patch(color=(0., 0., 1.), label='Inner reflector')
    tref = mpatches.Patch(color=(0.17, 0.81, 0.98), label='Top reflector')
    bref = mpatches.Patch(color=(0.98, 0.17, 0.95), label='Bottom reflector')

    cwd = os.getcwd()
    fname = get_sample_data('%s/../meshes/2D-fullcore-reflec.png' % (cwd))
    im = plt.imread(fname)
    plt.imshow(im)
    plt.legend(handles=[fuel, cool, mod, oref, iref, tref, bref],
               loc="upper left", bbox_to_anchor=(1.0, 1.0), fancybox=True)

    plt.axis('off')
    plt.savefig("2D-fullcore-reflec-mesh", dpi=300, bbox_inches="tight")


def main():
    # Adds legend to geometry figure
    geo_label()


if __name__ == "__main__":
    main()
