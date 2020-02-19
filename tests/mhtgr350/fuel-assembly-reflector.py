"""
This script produces the 2D geometry of a fuel assembly with
top and bottom reflectors.
"""

import numpy as np
import math as mt
import random as rd
import common as cm


def define_moderator(f, H, ns, dict_type):
    """
    Extrudes initial surfaces and produces the volumes.

    Parameters:
    -----------
    f: file object
    H: float
        assembly height
    ns: int
        number of surfaces
    dict_type: dictionary
        key='fuel' or 'coolant', value=index of the surfaces

    returns:
    --------
    """

    f.write("Plane Surface("+str(ns)+") = {")
    for i in range(1, ns):
        f.write(str(i)+", ")
    f.write(str(ns) + "};\n")

    f.write("//+\nExtrude {0, 0, " + str(H) + "} {\n  ")
    f.write("Surface{" + str(ns) + "}; ")
    for i in range(1, ns):
        f.write(" Surface{" + str(i) + "};")
    f.write(" Layers{10}; Recombine;\n}\n")


def add_reflector(f, d_x, hbot, htop, c, li, ns, dict_type):
    """
    Extrudes initial the surfaces of the moderator to make the reflector.

    Parameters:
    -----------
    f: file object
    hbot: float
        bottom reflector thickness
    htop: float
        top reflector thickness
    c: int
        number of lines
    li: int
        number of line/curved loops
    ns: int
        number of surfaces
    dict_type: dictionary
        key='fuel' or 'coolant', value=index of the surfaces

    returns:
    --------
    """

    d0 = d_x/2
    d1 = d_x/np.sqrt(3)
    d1 = round(d1, 4)
    d2 = d_x/2/np.sqrt(3)
    d2 = round(d2, 4)
    ce = 2*(c-1)+1
    le = 3*(c-1)+1

    f.write("// Bottom reflector\n")
    f.write("//+\nExtrude {0, 0, " + str(-hbot) + "} {\n  ")
    f.write("Surface{" + str(ns) + "}; ")
    for i in range(1, ns):
        f.write(" Surface{" + str(i) + "};")
    f.write("Layers{10}; Recombine;\n}\n")
    
    f.write("// Top reflector\n")
    f.write("//+\nExtrude {0, 0, " + str(htop) + "} {\n  ")
    f.write("Surface{" + str(2*ns+6) + "}; ")
    for i in dict_type['fuel']:
        f.write("Surface{" + str(2*ns+6+i) + "}; ")
    for i in dict_type['coolant']:
        f.write("Surface{" + str(2*ns+6+i) + "}; ")
    f.write("Layers{10}; Recombine;\n}\n")


def physical_entities(f, H, ns, dict_type):
    """
    Defines physical volumes and surfaces

    Parameters:
    -----------
    f: file object
    H: float
        assembly height
    ns: int
        number of surfaces
    dict_type: dictionary
        key='fuel' or 'coolant', value=index of the surfaces

    returns:
    --------
    """

    f.write('//+\nPhysical Volume("moderator") = {1};\n')

    f.write('//+\nPhysical Volume("coolant") = {')
    for i in dict_type['coolant'][:-1]:
        f.write(str(1+i)+', ')
    f.write(str(1+dict_type['coolant'][-1])+'};\n')

    f.write('//+\nPhysical Volume("fuel") = {')
    for i in dict_type['fuel'][:-1]:
        f.write(str(1+i)+', ')
    f.write(str(1+dict_type['fuel'][-1])+'};\n')

    f.write('//+\nPhysical Surface("moderator_bot") = {'
            + str(ns) + '};\n')
    f.write('//+\nPhysical Surface("moderator_top") = {'
            + str(2*ns+6) + '};\n')

    f.write('//+\nPhysical Surface("coolant_bot") = {')
    for i in dict_type['coolant'][:-1]:
        f.write(str(i)+', ')
    f.write(str(dict_type['coolant'][-1])+'};\n')

    f.write('//+\nPhysical Surface("coolant_top") = {')
    for i in dict_type['coolant'][:-1]:
        f.write(str(2*ns+6+i)+', ')
    f.write(str(2*ns+6+dict_type['coolant'][-1])+'};\n')

    f.write('//+\nPhysical Surface("fuel_bot") = {')
    for i in dict_type['fuel'][:-1]:
        f.write(str(i)+', ')
    f.write(str(dict_type['fuel'][-1])+'};\n')

    f.write('//+\nPhysical Surface("fuel_top") = {')
    for i in dict_type['fuel'][:-1]:
        f.write(str(2*ns+6+i)+', ')
    f.write(str(2*ns+6+dict_type['fuel'][-1])+'};\n')


def main():
    f = open("fuel-assembly-reflector.geo", "w+")

    dx = 36      # Block pitch (flat-to-flat ditance)
    rc = 0.794   # Large cooling channel radius
    rsc = 0.635  # Small cooling channel radius
    rf = 0.6223  # Fuel compact radius

    fcp = 1.88   # Fuel/coolant pitch
    h = 79.3     # Fuel assembly height
    stf = 1      # Number of fuel elements piled up
    H = stf*h    # Total height of the fuel column

    ht = 12.0     # Top reflector height
    hb = 16.0     # Bottom reflector height

    dict_type = {'fuel': [], 'coolant': [], 'moderator': []}

    c, li, ns = cm.add_lines(f, dx)
    c, li, ns, dict_type = cm.cchannels(f, rc, fcp, c, li, ns, dict_type)
    c, li, ns, dict_type = cm.fchannels(f, rf, fcp, c, li, ns, dict_type)
    define_moderator(f, H, ns, dict_type)

    c, li = add_reflector(f, dx, hb, ht, c, li, ns, dict_type)

    # physical_entities(f, H, ns, dict_type)

    f.close()


if __name__ == "__main__":
    main()
