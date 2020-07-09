import os
from matplotlib.cbook import get_sample_data
import matplotlib.patches as mpatches
import matplotlib.pyplot as plt


def geo_label1():
    '''
    Adds legend to '2D-unitcell-reflec'.
    '''
    fuel = mpatches.Patch(color=(0.87, 0.87, 0.87), label='Fuel')
    cool = mpatches.Patch(color=(0, 1., 0.), label='Coolant')
    mod = mpatches.Patch(color=(1., 0., 0.), label='Moderator')
    tref = mpatches.Patch(color=(0.9, 0.9, 0.0), label='Top reflector')
    bref = mpatches.Patch(color=(0., 0., 1.), label='Bottom reflector')

    cwd = os.getcwd()
    fname = get_sample_data('%s/../meshes/2D-unitcell-reflecB.png' % (cwd))
    im = plt.imread(fname)
    plt.imshow(im)
    plt.legend(handles=[fuel, cool, mod, tref, bref],
               loc="upper left", bbox_to_anchor=(1.0, 1.0), fancybox=True)

    plt.axis('off')
    plt.savefig("figures/2D-unitcell-reflecB", dpi=300, bbox_inches="tight")


def geo_label2():
    '''
    Adds legend to '2D-unitcell-reflec-homo'.
    '''
    homo = mpatches.Patch(color=(0.87, 0.87, 0.87), label='Fuel')
    tref = mpatches.Patch(color=(0, 1., 0.), label='Top reflector')
    bref = mpatches.Patch(color=(1., 0., 0.), label='Bottom reflector')

    cwd = os.getcwd()
    fname = get_sample_data('%s/../meshes/2D-unitcell-reflec-homo.png' % (cwd))
    im = plt.imread(fname)
    plt.imshow(im)
    plt.legend(handles=[tref, homo, bref],
               loc="upper left", bbox_to_anchor=(1.0, 1.0), fancybox=True)

    plt.axis('off')
    plt.savefig("figures/2D-unitcell-reflec-homo",
                dpi=300, bbox_inches="tight")


def geo_label3():
    '''
    Adds legend to '3D-unitcell'.
    '''
    fuel = mpatches.Patch(color=(0.87, 0.87, 0.87), label='Fuel')
    cool = mpatches.Patch(color=(0, 1., 0.), label='Coolant')
    mod = mpatches.Patch(color=(1., 0., 0.), label='Moderator')

    cwd = os.getcwd()
    fname = get_sample_data('%s/../meshes/3D-unitcell1.png' % (cwd))
    im = plt.imread(fname)
    plt.imshow(im)
    plt.legend(handles=[cool, mod, fuel],
               loc="upper left", bbox_to_anchor=(1.0, 1.0), fancybox=True)

    plt.axis('off')
    plt.savefig("figures/3D-unitcell1",
                dpi=300, bbox_inches="tight")

    fname = get_sample_data('%s/../meshes/3D-unitcell2.png' % (cwd))
    im = plt.imread(fname)
    plt.imshow(im)
    plt.legend(handles=[cool, mod, fuel],
               loc="upper left", bbox_to_anchor=(1.0, 1.0), fancybox=True)

    plt.axis('off')
    plt.savefig("figures/3D-unitcell2",
                dpi=300, bbox_inches="tight")


def geo_label4():
    '''
    Adds legend to '3D-unitcell-reflec'.
    '''
    fuel = mpatches.Patch(color=(0.87, 0.87, 0.87), label='Fuel')
    cool = mpatches.Patch(color=(0, 1., 0.), label='Coolant')
    mod = mpatches.Patch(color=(1., 0., 0.), label='Moderator')
    tref = mpatches.Patch(color=(0.9, 0.9, 0.0), label='Top reflector')
    bref = mpatches.Patch(color=(0., 0., 1.), label='Bottom reflector')

    cwd = os.getcwd()
    fname = get_sample_data('%s/../meshes/3D-unitcell-reflec.png' % (cwd))
    im = plt.imread(fname)
    plt.imshow(im)
    plt.legend(handles=[ tref, cool, mod, fuel, bref],
               loc="upper left", bbox_to_anchor=(1.0, 1.0), fancybox=True)

    plt.axis('off')
    plt.savefig("figures/3D-unitcell-reflec",
                dpi=300, bbox_inches="tight")


def geo_label5():
    '''
    Adds legend to '3D-unitcell-reflec-homo'.
    '''
    homo = mpatches.Patch(color=(0.87, 0.87, 0.87), label='Fuel')
    tref = mpatches.Patch(color=(0, 1., 0.), label='Top reflector')
    bref = mpatches.Patch(color=(1., 0., 0.), label='Bottom reflector')

    cwd = os.getcwd()
    fname = get_sample_data('%s/../meshes/3D-unitcell-reflec-homo.png' % (cwd))
    im = plt.imread(fname)
    plt.imshow(im)
    plt.legend(handles=[ tref, homo, bref],
               loc="upper left", bbox_to_anchor=(1.0, 1.0), fancybox=True)

    plt.axis('off')
    plt.savefig("figures/3D-unitcell-reflec-homo-mesh",
                dpi=300, bbox_inches="tight")


def geo_label6():
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
    plt.savefig("figures/2D-fullcore-reflec-mesh", dpi=300, bbox_inches="tight")


def geo_label7():
    '''
    Adds legend to '2D-fullcore-reflec-homo'.
    '''
    fuel = mpatches.Patch(color=(0.87, 0.87, 0.87), label='Fuel')
    oref = mpatches.Patch(color=(0, 1., 0.), label='Outer reflector')
    iref = mpatches.Patch(color=(1., 0., 0.), label='Inner reflector')
    tref = mpatches.Patch(color=(0.9, 0.9, 0.0), label='Top reflector')
    bref = mpatches.Patch(color=(0., 0., 1.), label='Bottom reflector')

    cwd = os.getcwd()
    fname = get_sample_data('%s/../meshes/2D-fullcore-reflec-homo.png' % (cwd))
    im = plt.imread(fname)
    plt.imshow(im)
    plt.legend(handles=[fuel, oref, iref, tref, bref],
               loc="upper left", bbox_to_anchor=(1.0, 1.0), fancybox=True)

    plt.axis('off')
    plt.savefig("figures/2D-fullcore-reflec-homo-mesh", dpi=300, bbox_inches="tight")


def geo_label8():
    '''
    Adds legend to '3D-assembly-30deg-reflec'.
    '''

    fuel = mpatches.Patch(color=(1., 0., 0.), label='Fuel')
    cool = mpatches.Patch(color=(0, 1., 0.), label='Coolant')
    mod = mpatches.Patch(color=(0., 0., 1.), label='Moderator')
    tref = mpatches.Patch(color=(0.9, 0.9, 0.0), label='Top reflector')
    bref = mpatches.Patch(color=(0.87, 0.87, 0.87), label='Bottom reflector')

    cwd = os.getcwd()
    fname = get_sample_data('%s/../meshes/3D-assembly-30deg-reflec1.png' % (cwd))
    im = plt.imread(fname)
    plt.imshow(im)
    plt.legend(handles=[fuel, cool, mod],
               loc="upper left", bbox_to_anchor=(1.0, 1.0), fancybox=True)

    plt.axis('off')
    plt.savefig("figures/3D-assembly-mesh1", dpi=300, bbox_inches="tight")

    fname = get_sample_data('%s/../meshes/3D-assembly-30deg-reflec2.png' % (cwd))
    im = plt.imread(fname)
    plt.imshow(im)
    plt.legend(handles=[tref, fuel, cool, mod, bref],
               loc="upper left", bbox_to_anchor=(1.0, 1.0), fancybox=True)

    plt.axis('off')
    plt.savefig("figures/3D-assembly-mesh2", dpi=300, bbox_inches="tight")


def geo_label9():
    '''
    Adds legend to '3D-assembly-30deg-reflec-homo'.
    '''
    tref = mpatches.Patch(color=(0, 1., 0.), label='Top reflector')
    fuel = mpatches.Patch(color=(1., 0., 0.), label='Fuel')
    bref = mpatches.Patch(color=(0.87, 0.87, 0.87), label='Bottom reflector')

    cwd = os.getcwd()
    fname = get_sample_data('%s/../meshes/3D-assembly-30deg-reflec3.png' % (cwd))
    im = plt.imread(fname)
    plt.imshow(im)
    plt.legend(handles=[tref, fuel, bref],
               loc="upper left", bbox_to_anchor=(1.0, 1.0), fancybox=True)

    plt.axis('off')
    plt.savefig("figures/3D-assembly-homo-mesh", dpi=300, bbox_inches="tight")


def geo_label10():
    '''
    Adds legend to '3D-fullcore-120-homo'.
    '''

    iref = mpatches.Patch(color=(1., 0., 0.), label='Inner reflector')
    fuel = mpatches.Patch(color=(0, 1., 0.), label='Fuel')
    oref = mpatches.Patch(color=(0., 0., 1.), label='Outer reflector')
    tref = mpatches.Patch(color=(0.9, 0.9, 0.0), label='Top reflector')
    bref = mpatches.Patch(color=(0.87, 0.87, 0.87), label='Bottom reflector')

    cwd = os.getcwd()
    fname = get_sample_data('%s/../meshes/3D-fullcore-120-homo.png' % (cwd))
    im = plt.imread(fname)
    plt.imshow(im)
    plt.legend(handles=[tref, iref, fuel, oref, bref],
               loc="upper left", bbox_to_anchor=(1.0, 1.0), fancybox=True)

    plt.axis('off')
    plt.savefig("figures/3D-fullcore-120-homo-mesh", dpi=300, bbox_inches="tight")

    cwd = os.getcwd()
    fname = get_sample_data('%s/../meshes/3D-fullcore-120-homo2.png' % (cwd))
    im = plt.imread(fname)
    plt.imshow(im)
    plt.legend(handles=[iref, fuel, oref],
               loc="upper left", bbox_to_anchor=(1.0, 1.0), fancybox=True)

    plt.axis('off')
    plt.savefig("figures/3D-fullcore-120-homo-mesh2", dpi=300, bbox_inches="tight")

# Adds legend to figures
# geo_label1()
# geo_label2()
# geo_label3()
# geo_label4()
# geo_label5()
# geo_label6()
# geo_label7()
# geo_label8()
# geo_label9()
geo_label10()