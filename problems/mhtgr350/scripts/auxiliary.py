import os
from matplotlib.cbook import get_sample_data
import matplotlib.patches as mpatches
import matplotlib.pyplot as plt


def geo_label():
    '''
    Adds legend to '2D-fullcore-reflec'.

    Colors:
    * Yellow: color=(0.9, 0.9, 0.0)
    * Red: color=(1.0, 0.0, 0.0)
    * Green: color=(0.0, 1.0, 0.0)
    * Blue: color=(0.0, 0.0, 1.0)
    * Grey: color=(0.87, 0.87, 0.87)
    * Light blue: color=(0.17, 0.81, 0.98)
    * Magenta: color=(0.98, 0.17, 0.95)
    '''
    tref = mpatches.Patch(color=(0.9, 0.9, 0.0), label='Top reflector')
    iref = mpatches.Patch(color=(1., 0., 0.), label='Inner reflector')
    fuel = mpatches.Patch(color=(0, 1., 0.), label='Fuel')
    oref = mpatches.Patch(color=(0., 0., 1.), label='Outer reflector')
    bref = mpatches.Patch(color=(0.87, 0.87, 0.87), label='Bottom reflector')
    
    cwd = os.getcwd()
    fname = get_sample_data('%s/../3D-neutronics/3D-fullcore-60-homo-meshA1.png' % (cwd))
    im = plt.imread(fname)
    plt.imshow(im)
    plt.legend(handles=[tref, iref, fuel, oref, bref],
               loc="upper left", bbox_to_anchor=(1.0, 1.0), fancybox=True)

    plt.axis('off')
    plt.savefig("3D-fullcore-60-homo-meshA2", dpi=300, bbox_inches="tight")

    fname = get_sample_data('%s/../3D-neutronics/3D-fullcore-60-homo-meshB1.png' % (cwd))
    im = plt.imread(fname)
    plt.imshow(im)
    plt.legend(handles=[iref, fuel, oref],
               loc="upper left", bbox_to_anchor=(1.0, 1.0), fancybox=True)

    plt.axis('off')
    plt.savefig("3D-fullcore-60-homo-meshB2", dpi=300, bbox_inches="tight")


def main():
    # Adds legend to geometry figure
    geo_label()


if __name__ == "__main__":
    main()
