"""
This script produces the 2D geometry of a fuel assembly.
"""

import numpy as np
import math as mt
import random as rd


def add_lines(f, d_x):
    """
    Adds boundary lines
    Parameters:
    -----------
    f:
    d_x:
    returns:
    c = number of lines
    l = ?
    ns = ?
    ls = ?
    """

    f.write("//+\n")
    f.write("SetFactory('OpenCASCADE');\n")
    f.write("// Define Points of the assembly boundaries \n")

    d0 = d_x/2
    d1 = d_x/np.sqrt(3)
    d1 = round(d1, 4)
    d2 = d_x/2/np.sqrt(3)
    d2 = round(d2, 4)

    f.write("Point(1) = { " + str(d2) + ", " + str(d0) + ", 0, 1.0};\n")
    f.write("Point(2) = { " + str(d1) + ", 0, 0, 1.0};\n")
    f.write("Point(3) = { " + str(d2) + ", " + str(-d0) + ", 0, 1.0};\n")
    f.write("Point(4) = { " + str(-d2) + ", " + str(-d0) + ", 0, 1.0};\n")
    f.write("Point(5) = { " + str(-d1) + ", 0, 0, 1.0};\n")
    f.write("Point(6) = { " + str(-d2) + ", " + str(d0) + ", 0, 1.0};\n")

    f.write("// Define Lines in the boundary \n")
    f.write("Line(1) = {1, 2};\n")
    f.write("Line(2) = {2, 3};\n")
    f.write("Line(3) = {3, 4};\n")
    f.write("Line(4) = {4, 5};\n")
    f.write("Line(5) = {5, 6};\n")
    f.write("Line(6) = {6, 1};\n")
    f.write("// Boundary of the assembly \n")
    f.write("Curve Loop(1) = {1, 2, 3, 4, 5, 6};\n")
    f.write("// Defines fuel channel Assembly\n")

    c = 7
    li = 2
    ns = 1

    return c, li, ns


def place_circles(f, r, d_x, d_y, col, row, c, li, ns, type, dict_type):
    for j in row:
        cc = 0
        for i in col:
            f.write("Circle(" + str(cc + c) + ") = { " + str(i*d_x)
                    + ", " + str(j*d_y) + ", 0, " + str(r) + ", 0, 2*Pi};\n")
            f.write("Curve Loop(" + str(li) + ") = {" + str(cc + c) + "};\n")
            f.write("Plane Surface(" + str(ns) + ") = {" + str(li) + "};\n")

            if type == 'fuel' or type == 'coolant' or type == 'moderator':
                dict_type[type].append(ns)
            else:
                print('Wrong type')
                sys.exit()
            cc += 1
            li += 1
            ns += 1
        c += cc

    return c, li, ns, dict_type


def cchannels(f, rc, fcp, c, li, ns, dict_type):
    dx = fcp/2
    dy = fcp*np.sqrt(3)/2
    dy = round(dy, 4)
    s = 2*dy

    row = [0]
    col = [0]
    c, li, ns, dict_type = place_circles(
        f, rc, fcp, s, col, row, c, li, ns, 'coolant', dict_type)
    # from the center to the top
    """
    ls = 0
    row = [-1, 0, 1]
    col = [-9, -6, -3, 0, 3, 6, 9]
    c, li, ns, dict_type = place_circles(
        f, rc, fcp, s, col, row, c, li, ns, 'coolant', dict_type)

    row = [-4, -3, -2, 2, 3, 4]
    col = [-6, -3, 0, 3, 6]
    c, li, ns, dict_type = place_circles(
        f, rc, fcp, s, col, row, c, li, ns, 'coolant', dict_type)

    row = [-5, 5]
    col = [-3, 0, 3]
    c, li, ns, dict_type = place_circles(
        f, rc, fcp, s, col, row, c, li, ns, 'coolant', dict_type)

    row = [-5, -3, -1, 1, 3, 5]
    col1 = [3, 9, 15]
    col2 = [x * -1 for x in col1]
    col = col2 + col1
    c, li, ns, dict_type = place_circles(
        f, rc, dx, dy, col, row, c, li, ns, 'coolant', dict_type)

    row = [-9, -7, 7, 9]
    col1 = [3, 9]
    col2 = [x * -1 for x in col1]
    col = col2 + col1
    c, li, ns, dict_type = place_circles(
        f, rc, dx, dy, col, row, c, li, ns, 'coolant', dict_type)
    """
    return c, li, ns, dict_type


def fchannels(f, rf, fcp, c, li, ns, dict_type):
    dx = fcp/2             # pitch * sin (30 degrees)
    dy = fcp*np.sqrt(3)/2  # pitch * cos (30 degrees)
    dy = round(dy, 4)
    s = 2*dy

    row = [0]
    col = [1]
    c, li, ns, dict_type = place_circles(
        f, rf, fcp, s, col, row, c, li, ns, 'fuel', dict_type)
    # from the center to the top
    """
    ls = 0
    row = [0]
    col1 = [1, 2, 4, 5, 7, 8, 10]
    col2 = [x * -1 for x in col1]
    col = col2 + col1
    c, li, ns, dict_type = place_circles(
        f, rf, fcp, s, col, row, c, li, ns, 'fuel', dict_type)

    row = [-2, -1, 1, 2]
    col1 = [1, 2, 4, 5, 7, 8]
    col2 = [x * -1 for x in col1]
    col = col2 + col1
    c, li, ns, dict_type = place_circles(
        f, rf, fcp, s, col, row, c, li, ns, 'fuel', dict_type)

    row = [-3, 3]
    col1 = [1, 2, 4, 5, 7]
    col2 = [x * -1 for x in col1]
    col = col2 + col1
    c, li, ns, dict_type = place_circles(
        f, rf, fcp, s, col, row, c, li, ns, 'fuel', dict_type)

    row = [-5, -4, 4, 5]
    col1 = [1, 2, 4, 5]
    col2 = [x * -1 for x in col1]
    col = col2 + col1
    c, li, ns, dict_type = place_circles(
        f, rf, fcp, s, col, row, c, li, ns, 'fuel', dict_type)

    row = [-1, 1]
    col1 = [1, 5, 7, 11, 13, 17, 19]
    col2 = [x * -1 for x in col1]
    col = col2 + col1
    c, li, ns, dict_type = place_circles(
        f, rf, dx, dy, col, row, c, li, ns, 'fuel', dict_type)

    row = [-3, 3]
    col1 = [1, 5, 7, 11, 13, 17]
    col2 = [x * -1 for x in col1]
    col = col2 + col1
    c, li, ns, dict_type = place_circles(
        f, rf, dx, dy, col, row, c, li, ns, 'fuel', dict_type)

    row = [-7, -5, 5, 7]
    col1 = [1, 5, 7, 11, 13]
    col2 = [x * -1 for x in col1]
    col = col2 + col1
    c, li, ns, dict_type = place_circles(
        f, rf, dx, dy, col, row, c, li, ns, 'fuel', dict_type)

    row = [-9, 9]
    col1 = [1, 5, 7, 11]
    col2 = [x * -1 for x in col1]
    col = col2 + col1
    c, li, ns, dict_type = place_circles(
        f, rf, dx, dy, col, row, c, li, ns, 'fuel', dict_type)
    """
    return c, li, ns, dict_type


def define_moderator(f, H, ns, dict_type):
    f.write("Plane Surface("+str(ns)+") = {")
    for i in range(1, ns):
        f.write(str(i)+", ")
    f.write(str(ns) + "};\n")

    f.write("//+\nExtrude {0, 0, " + str(H) + "} {\n  ")
    f.write("Surface{" + str(ns) + "}; ")
    for i in range(1, ns):
        f.write(" Surface{" + str(i) + "};")
    f.write(" Layers{10}; Recombine;\n}\n")


def physical_surfaces(f, H, ns, dict_type):
    f.write('//+\nPhysical Surface("moderator_bottom") = {'
            + str(ns) + '};\n')

    f.write('//+\nPhysical Surface("coolant_bottom") = {')
    for i in dict_type['coolant'][:-1]:
        f.write(str(i)+', ')
    f.write(str(dict_type['coolant'][-1])+'};\n')

    f.write('//+\nPhysical Surface("fuel_bottom") = {')
    for i in dict_type['fuel'][:-1]:
        f.write(str(i)+', ')
    f.write(str(dict_type['fuel'][-1])+'};\n')

    f.write('//+\nPhysical Surface("moderator_top") = {'
            + str(2*ns+6) + '};\n')

    f.write('//+\nPhysical Surface("coolant_top") = {')
    for i in dict_type['coolant'][:-1]:
        f.write(str(2*ns+6+i)+', ')
    f.write(str(2*ns+6+dict_type['coolant'][-1])+'};\n')

    f.write('//+\nPhysical Surface("fuel_top") = {')
    for i in dict_type['fuel'][:-1]:
        f.write(str(2*ns+6+i)+', ')
    f.write(str(2*ns+6+dict_type['fuel'][-1])+'};\n')

    f.write('//+\nPhysical Volume("moderator") = {1};\n')

    f.write('//+\nPhysical Volume("coolant") = {')
    for i in dict_type['coolant'][:-1]:
        f.write(str(1+i)+', ')
    f.write(str(1+dict_type['coolant'][-1])+'};\n')

    f.write('//+\nPhysical Volume("fuel") = {')
    for i in dict_type['fuel'][:-1]:
        f.write(str(1+i)+', ')
    f.write(str(1+dict_type['fuel'][-1])+'};\n')


def add_reflector(f, d_x, hbot, htop, c, li):
    """
    Adds boundary lines
    Parameters:
    -----------
    f:
    d_x:
    returns:
    c = number of lines
    l = ?
    ns = ?
    ls = ?
    """

    d0 = d_x/2
    d1 = d_x/np.sqrt(3)
    d1 = round(d1, 4)
    d2 = d_x/2/np.sqrt(3)
    d2 = round(d2, 4)
    ce = 2*(c-1)+1
    le = 3*(c-1)+1

    f.write("// Bottom reflector\n")
    f.write("Point(" + str(ce) + ") = { " + str(d2) + ", " + str(d0) + ", " + str(hbot) + ", 1.0};\n")
    f.write("Point(" + str(ce+1) + ") = { " + str(d1) + ", 0, " + str(hbot) + ", 1.0};\n")
    f.write("Point(" + str(ce+2) + ") = { " + str(d2) + ", " + str(-d0) + ", " + str(hbot) + ", 1.0};\n")
    f.write("Point(" + str(ce+3) + ") = { " + str(-d2) + ", " + str(-d0) + ", " + str(hbot) + ", 1.0};\n")
    f.write("Point(" + str(ce+4) + ") = { " + str(-d1) + ", 0, " + str(hbot) + ", 1.0};\n")
    f.write("Point(" + str(ce+5) + ") = { " + str(-d2) + ", " + str(d0) + ", " + str(hbot) + ", 1.0};\n")

    f.write("Line(" + str(le) + ") = {" + str(ce) + ", " + str(ce+1) + "};\n")
    f.write("Line(" + str(le+1) + ") = {" + str(ce+1) + ", " + str(ce+2) + "};\n")
    f.write("Line(" + str(le+2) + ") = {" + str(ce+2) + ", " + str(ce+3) + "};\n")
    f.write("Line(" + str(le+3) + ") = {" + str(ce+3) + ", " + str(ce+4) + "};\n")
    f.write("Line(" + str(le+4) + ") = {" + str(ce+4) + ", " + str(ce+5) + "};\n")
    f.write("Line(" + str(le+5) + ") = {" + str(ce+5) + ", " + str(ce) + "};\n")
    f.write("//+ \n")
    f.write("Line(" + str(le+6) + ") = {1, " + str(ce) + "};\n")
    f.write("Line(" + str(le+7) + ") = {2, " + str(ce+1) + "};\n")
    f.write("Line(" + str(le+8) + ") = {3, " + str(ce+2) + "};\n")
    f.write("Line(" + str(le+9) + ") = {4, " + str(ce+3) + "};\n")
    f.write("Line(" + str(le+10) + ") = {5, " + str(ce+4) + "};\n")
    f.write("Line(" + str(le+11) + ") = {6, " + str(ce+5) + "};\n")

    f.write("// Top reflector\n")
    f.write("Point(" + str(ce+6) + ") = { " + str(d2) + ", " + str(d0) + ", " + str(htop) + ", 1.0};\n")
    f.write("Point(" + str(ce+7) + ") = { " + str(d1) + ", 0, " + str(htop) + ", 1.0};\n")
    f.write("Point(" + str(ce+8) + ") = { " + str(d2) + ", " + str(-d0) + ", " + str(htop) + ", 1.0};\n")
    f.write("Point(" + str(ce+9) + ") = { " + str(-d2) + ", " + str(-d0) + ", " + str(htop) + ", 1.0};\n")
    f.write("Point(" + str(ce+10) + ") = { " + str(-d1) + ", 0, " + str(htop) + ", 1.0};\n")
    f.write("Point(" + str(ce+11) + ") = { " + str(-d2) + ", " + str(d0) + ", " + str(htop) + ", 1.0};\n")

    f.write("Line(" + str(le+12) + ") = {" + str(ce+6) + ", " + str(ce+7) + "};\n")
    f.write("Line(" + str(le+13) + ") = {" + str(ce+7) + ", " + str(ce+8) + "};\n")
    f.write("Line(" + str(le+14) + ") = {" + str(ce+8) + ", " + str(ce+9) + "};\n")
    f.write("Line(" + str(le+15) + ") = {" + str(ce+9) + ", " + str(ce+10) + "};\n")
    f.write("Line(" + str(le+16) + ") = {" + str(ce+10) + ", " + str(ce+11) + "};\n")
    f.write("Line(" + str(le+17) + ") = {" + str(ce+11) + ", " + str(ce+6) + "};\n")
    f.write("//+ \n")
    f.write("Line(" + str(le+18) + ") = {" + str(c) + ", " + str(ce+6) + "};\n")
    f.write("Line(" + str(le+19) + ") = {" + str(c+1) + ", " + str(ce+7) + "};\n")
    f.write("Line(" + str(le+20) + ") = {" + str(c+2) + ", " + str(ce+8) + "};\n")
    f.write("Line(" + str(le+21) + ") = {" + str(c+3) + ", " + str(ce+9) + "};\n")
    f.write("Line(" + str(le+22) + ") = {" + str(c+4) + ", " + str(ce+10) + "};\n")
    f.write("Line(" + str(le+23) + ") = {" + str(c+5) + ", " + str(ce+11) + "};\n")
    # f.write("Curve Loop(" + str(li) + ") = {")
    # for i in range(5):
    #     f.write(str(ce+i) + ", ")
    # f.write(str(ce+5) + "};\n")
    li += 1

    return c, li


def main():
    f = open("fuel-assembly.geo", "w+")

    dx = 36      # Block pitch (flat-to-flat ditance)
    rc = 0.794   # Large cooling channel radius
    rsc = 0.635  # Small cooling channel radius
    rf = 0.6223  # Fuel compact radius

    fcp = 1.88   # Fuel/coolant pitch
    h = 79.3     # Fuel assembly height
    stf = 1      # Number of fuel elements piled up
    H = stf*h    # Total height of the fuel column

    hb = 10.0     # Bottom reflector height
    ht = 10.0     # Top reflector height

    dict_type = {'fuel': [], 'coolant': [], 'moderator': []}

    c, li, ns = add_lines(f, dx)
    c, li, ns, dict_type = cchannels(f, rc, fcp, c, li, ns, dict_type)
    c, li, ns, dict_type = fchannels(f, rf, fcp, c, li, ns, dict_type)
    print(c, li)
    define_moderator(f, H, ns, dict_type)
    c, li = add_reflector(f, dx, -hb, H+ht, c, li)
    physical_surfaces(f, H, ns, dict_type)

    f.close()


if __name__ == "__main__":
    main()
