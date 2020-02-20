"""
This script produces the 2D geometry of a fuel assembly with
top and bottom reflectors.
"""

import numpy as np
import math as mt
import random as rd
import common as cm


def add_reflector(f, d_x, hbot, htop, h, c, li, ns, dict_type):
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
    f.write("Layers{" + str(hbot/h) + "}; Recombine;\n}\n")
    
    f.write("// Top reflector\n")
    f.write("//+\nExtrude {0, 0, " + str(htop) + "} {\n  ")
    f.write("Surface{" + str(2*ns+6) + "}; ")
    for i in dict_type['coolant']:
        f.write("Surface{" + str(2*ns+6+i) + "}; ")
    for i in dict_type['fuel']:
        f.write("Surface{" + str(2*ns+6+i) + "}; ")
    f.write("Layers{" + str(htop/h) + "}; Recombine;\n}\n")


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

    f.write('//+\nPhysical Volume("moderator") = {1, ' + str(1+ns)
    	    + ', ' + str(1+2*ns) + ', ')
    for i in dict_type['fuel'][:-1]:
        f.write(str(1+ns+i)+', ')
        f.write(str(1+2*ns+i)+', ')
    f.write(str(1+ns+dict_type['fuel'][-1])+', ')
    f.write(str(1+2*ns+dict_type['fuel'][-1])+'};\n')

    f.write('//+\nPhysical Volume("coolant") = {')
    for i in dict_type['coolant'][:-1]:
        f.write(str(1+i)+', ')
        f.write(str(1+ns+i)+', ')
        f.write(str(1+2*ns+i)+', ')
    f.write(str(1+dict_type['coolant'][-1])+', ')
    f.write(str(1+ns+dict_type['coolant'][-1])+', ')
    f.write(str(1+2*ns+dict_type['coolant'][-1])+'};\n')

    f.write('//+\nPhysical Volume("fuel") = {')
    for i in dict_type['fuel'][:-1]:
        f.write(str(1+i)+', ')
    f.write(str(1+dict_type['fuel'][-1])+'};\n')

    f.write('//+\n')
    f.write('Physical Surface("ref_bot") = {'
            + str(2*(2*(ns-1)+6)+3) + ', ')
    for i in dict_type['fuel'][:-1]:
        f.write(str(2*(2*(ns-1)+6)+3+i) + ', ')
    f.write(str(2*(2*(ns-1)+6)+3+dict_type['fuel'][-1])+'};\n')

    f.write('Physical Surface("ref_top") = {'
            + str(3*(2*(ns-1)+6)+4) + ', ')
    for i in dict_type['fuel'][:-1]:
        f.write(str(3*(2*(ns-1)+6)+4+i) + ', ')
    f.write(str(3*(2*(ns-1)+6)+4+dict_type['fuel'][-1])+'};\n')

    f.write('Physical Surface("cool_bot") = {')
    for i in dict_type['coolant'][:-1]:
        f.write(str(2*(2*(ns-1)+6)+3+i) + ', ')
    f.write(str(2*(2*(ns-1)+6)+3+dict_type['coolant'][-1])+'};\n')

    f.write('Physical Surface("cool_top") = {')
    for i in dict_type['coolant'][:-1]:
        f.write(str(3*(2*(ns-1)+6)+4+i) + ', ')
    f.write(str(3*(2*(ns-1)+6)+4+dict_type['coolant'][-1])+'};\n')

    f.write('Physical Surface("fuel_bot") = {')
    for i in dict_type['fuel'][:-1]:
        f.write(str(i)+', ')
    f.write(str(dict_type['fuel'][-1])+'};\n')

    # To add the fuel_top surface uncomment the following lines
    """
    f.write('//+\nPhysical Surface("fuel_top") = {')
    for i in dict_type['fuel'][:-1]:
        f.write(str(2*(ns-1)+2+6+i)+', ')
    f.write(str(2*(ns-1)+2+6+dict_type['fuel'][-1])+'};\n')
    """


def main():
    f = open("fuel-assembly-reflector.geo", "w+")

    dx = 36      # Block pitch (flat-to-flat ditance)
    rc = 0.794   # Large cooling channel radius
    rsc = 0.635  # Small cooling channel radius
    rf = 0.635   # Fuel channel radius
    # rf = 0.6223  # Fuel compact radius

    fcp = 1.88   # Fuel/coolant pitch
    Ha = 79.3    # Fuel assembly height
    stf = 10     # Number of fuel elements piled up
    H = stf*Ha   # Total height of the fuel column

    Ht = 120   # Top reflector height
    Hb = 160   # Bottom reflector height
    h = 20.0     # Fineite Element Discretization

    dict_type = {'fuel': [], 'coolant': [], 'moderator': []}

    c, li, ns = cm.add_lines(f, dx, h)
    c, li, ns, dict_type = cm.cchannels(f, rc, fcp, c, li, ns, dict_type)
    c, li, ns, dict_type = cm.fchannels(f, rf, fcp, c, li, ns, dict_type)
    print(ns)
    cm.define_moderator(f, H, h, ns, dict_type)

    add_reflector(f, dx, Hb, Ht, h, c, li, ns, dict_type)

    physical_entities(f, H, ns, dict_type)

    f.close()


if __name__ == "__main__":
    main()
