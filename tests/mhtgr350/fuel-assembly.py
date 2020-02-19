"""
This script produces the 2D geometry of a fuel assembly without
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
    f = open("fuel-assembly.geo", "w+")

    dx = 36      # Block pitch (flat-to-flat ditance)
    rc = 0.794   # Large cooling channel radius
    rsc = 0.635  # Small cooling channel radius
    rf = 0.6223  # Fuel compact radius

    fcp = 1.88   # Fuel/coolant pitch
    h = 79.3     # Fuel assembly height
    stf = 1      # Number of fuel elements piled up
    H = stf * h  # Total height of the fuel column

    dict_type = {'fuel': [], 'coolant': [], 'moderator': []}

    c, li, ns = cm.add_lines(f, dx)
    c, li, ns, dict_type = cm.cchannels(f, rc, fcp, c, li, ns, dict_type)
    c, li, ns, dict_type = cm.fchannels(f, rf, fcp, c, li, ns, dict_type)
    define_moderator(f, H, ns, dict_type)
    physical_entities(f, H, ns, dict_type)

    f.close()


if __name__ == "__main__":
    main()
