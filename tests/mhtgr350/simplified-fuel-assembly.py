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

    f.write("Point(1) = { "+ str(d2) +", "+ str(d0) +", 0, 1.0};\n")
    f.write("Point(2) = { "+ str(d1) +", 0, 0, 1.0};\n")
    f.write("Point(3) = { "+ str(d2) +", "+ str(-d0) +", 0, 1.0};\n")
    f.write("Point(4) = { "+ str(-d2) +", "+ str(-d0) +", 0, 1.0};\n")
    f.write("Point(5) = { "+ str(-d1) +", 0, 0, 1.0};\n")
    f.write("Point(6) = { "+ str(-d2) +", "+ str(d0) +", 0, 1.0};\n")

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
    l = 2
    ns = 1
    ls = [1]

    return c, l, ns, ls


def place_circles(f, r, d_x, d_y, col, row, c, l, ns, ls, type, dict_type):
    for j in row:
        cc = 0
        for i in col:
            f.write("Circle("+ str(cc + c) +") = { "+ str(i*d_x) +", "+ str(j*d_y) +", 0, "+ str(r) +", 0, 2*Pi};\n")
            f.write("Curve Loop("+ str(l) +") = {"+ str(cc + c) +"};\n")
            f.write("Plane Surface("+ str(ns) +") = {"+ str(l) +"};\n")
            ls.append(l)
            
            if type == 'fuel' or type == 'coolant' or type == 'moderator':
                dict_type[type].append(ns)
            else:
                print('Wrong type')
                sys.exit()
            cc += 1
            l += 1
            ns += 1
        c += cc
    
    return c, l, ns, ls, dict_type

def cooling_channels(f, rc, fcp, c, l, ns, ls, dict_type):
    dx = fcp/2
    dy = fcp*np.sqrt(3)/2 
    dy = round(dy, 4)
    s = 2*dy

    # from the center to the top
    row = [-1, 0, 1]
    col = [-9, -6, -3, 0, 3, 6, 9]
    c, l, ns, ls, dict_type = place_circles(f, rc, fcp, s, col, row, c, l, ns, ls, 'coolant', dict_type)

    row = [-4, -3, -2, 2, 3, 4]
    col = [-6, -3, 0, 3, 6]
    c, l, ns, ls, dict_type = place_circles(f, rc, fcp, s, col, row, c, l, ns, ls, 'coolant', dict_type)

    row = [-5, 5]
    col = [-3, 0, 3]
    c, l, ns, ls, dict_type = place_circles(f, rc, fcp, s, col, row, c, l, ns, ls, 'coolant', dict_type)

    row = [-5, -3, -1, 1, 3, 5]
    col1 = [3, 9, 15]
    col2 = [x * -1 for x in col1]
    col = col2 + col1
    c, l, ns, ls, dict_type = place_circles(f, rc, dx, dy, col, row, c, l, ns, ls, 'coolant', dict_type)

    row = [-9, -7, 7, 9]
    col1 = [3, 9]
    col2 = [x * -1 for x in col1]
    col = col2 + col1
    c, l, ns, ls, dict_type = place_circles(f, rc, dx, dy, col, row, c, l, ns, ls, 'coolant', dict_type)
    
    return c, l, ns, ls, dict_type

def fuel_channels(f, rf, fcp, c, l, ns, ls, dict_type):
    dx = fcp/2             # pitch * sin (30 degrees)
    dy = fcp*np.sqrt(3)/2  # pitch * cos (30 degrees)
    dy = round(dy, 4)
    s = 2*dy
    
    # from the center to the top
    row = [0]
    col1 = [1, 2, 4, 5, 7, 8, 10]
    col2 = [x * -1 for x in col1]
    col = col2 + col1
    c, l, ns, ls, dict_type = place_circles(f, rf, fcp, s, col, row, c, l, ns, ls, 'fuel', dict_type)

    row = [-2, -1, 1, 2]
    col1 = [1, 2, 4, 5, 7, 8]
    col2 = [x * -1 for x in col1]
    col = col2 + col1
    c, l, ns, ls, dict_type = place_circles(f, rf, fcp, s, col, row, c, l, ns, ls, 'fuel', dict_type)

    row = [-3, 3]
    col1 = [1, 2, 4, 5, 7]
    col2 = [x * -1 for x in col1]
    col = col2 + col1
    c, l, ns, ls, dict_type = place_circles(f, rf, fcp, s, col, row, c, l, ns, ls, 'fuel', dict_type)

    row = [-5, -4, 4, 5]
    col1 = [1, 2, 4, 5]
    col2 = [x * -1 for x in col1]
    col = col2 + col1
    c, l, ns, ls, dict_type = place_circles(f, rf, fcp, s, col, row, c, l, ns, ls, 'fuel', dict_type)

    row = [-1, 1]
    col1 = [1, 5, 7, 11, 13, 17, 19]
    col2 = [x * -1 for x in col1]
    col = col2 + col1
    c, l, ns, ls, dict_type = place_circles(f, rf, dx, dy, col, row, c, l, ns, ls, 'fuel', dict_type)

    row = [-3, 3]
    col1 = [1, 5, 7, 11, 13, 17]
    col2 = [x * -1 for x in col1]
    col = col2 + col1
    c, l, ns, ls, dict_type = place_circles(f, rf, dx, dy, col, row, c, l, ns, ls, 'fuel', dict_type)

    row = [-7, -5, 5, 7]
    col1 = [1, 5, 7, 11, 13]
    col2 = [x * -1 for x in col1]
    col = col2 + col1
    c, l, ns, ls, dict_type = place_circles(f, rf, dx, dy, col, row, c, l, ns, ls, 'fuel', dict_type)

    row = [-9, 9]
    col1 = [1, 5, 7, 11]
    col2 = [x * -1 for x in col1]
    col = col2 + col1
    c, l, ns, ls, dict_type = place_circles(f, rf, dx, dy, col, row, c, l, ns, ls, 'fuel', dict_type)

    return c, l, ns, ls, dict_type

def define_moderator(f, H, ns, ls, dict_type):
    f.write("Plane Surface("+str(ns)+") = {")
    for i in ls:
        if i == ls[-1]:
            f.write(str(i))
        else:
           f.write(str(i)+", ")
    f.write("};\n")

    f.write("//+\nExtrude {0, 0, "+ str(H) +"} {\n  ")
    f.write("Surface{"+ str(ns) +"}; ")
    for i in range(1, ns):
        f.write(" Surface{"+ str(i) +"};")
    f.write(" Layers{10}; Recombine;\n}\n")

    f.write('//+\nPhysical Surface("moderator_bottom") = {'+ str(ns) +'};\n')  

    f.write('//+\nPhysical Surface("coolant_bottom") = {')
    for i in dict_type['coolant'][:-1]:
        f.write(str(i)+', ')
    f.write(str(dict_type['coolant'][-1])+'};\n')

    f.write('//+\nPhysical Surface("fuel_bottom") = {')
    for i in dict_type['fuel'][:-1]:
        f.write(str(i)+', ')
    f.write(str(dict_type['fuel'][-1])+'};\n')

    f.write('//+\nPhysical Surface("moderator_top") = {'+ str(2*ns+6) +'};\n')

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

    return ns, ls, dict_type

def main():    
    f = open("fuel-assembly.geo","w+")

    dx = 36      # Block pitch (flat-to-flat ditance)
    rc = 0.794   # Large cooling channel radius
    rsc = 0.635  # Small cooling channel radius
    rf = 0.6223  # Fuel compact radius

    fcp = 1.88   # Fuel/coolant pitch
    h = 79.3     # Fuel assembly height
    stf = 1      # Number of fuel elements piled up
    H = stf*h    # Total height of the fuel column

    dict_type = {'fuel': [], 'coolant': [], 'moderator': []}

    c, l, ns, ls = add_lines(f, dx)
    c, l, ns, ls, dict_type = cooling_channels(f, rc, fcp, c, l, ns, ls, dict_type)
    c, l, ns, ls, dict_type = fuel_channels(f, rf, fcp, c, l, ns, ls, dict_type)
    ns, ls, dict_type = define_moderator(f, H, ns, ls, dict_type)

    f.close()

if __name__ == "__main__":
    main()