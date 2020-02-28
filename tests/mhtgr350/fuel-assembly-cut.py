"""
This script produces the 2D geometry of a cut of the fuel assembly without
top and bottom reflectors.
"""

import numpy as np
import math as mt
import random as rd
import common as cm


def check_domain(x, y, r, a):
    """
    If the circle is fully or partially inside the domain returns TRUE

    Parameters:
    -----------
    x: float
        center of the circle x coordinate
    y: float
        center of the circle y coordinate
    r: float
        circle radius
    a: float
        angle of the lower plane

    returns:
    --------
    inside: boolean
    """

    beta1 = mt.atan2(y + r * np.cos(a), x - r * np.sin(a))
    beta2 = mt.atan2(y, x + r)
    if beta1 > a and beta2 < np.pi/2:
        inside = True
    else:
        inside = False   

    return inside


def check_upper(x, y, r):
    """
    If the circle intersects the line at 90 degrees, returns TRUE

    Parameters:
    -----------
    x: float
        center of the circle x coordinate
    y: float
        center of the circle y coordinate
    r: float
        circle radius

    returns:
    --------
    intersect: boolean
    """

    xo = x - r
    if xo < 0:
        intersect = True
    else:
        intersect = False

    return intersect


def check_lower(x, y, r, a):
    """
    If the circle intersects the line at angle 'a', returns TRUE

    Parameters:
    -----------
    x: float
        center of the circle x coordinate
    y: float
        center of the circle y coordinate
    r: float
        circle radius
    a: float
        plane angle

    returns:
    --------
    intersect: boolean
    """

    xo = x + r * np.sin(a)
    yo = y - r * np.cos(a)
    ac = mt.atan(yo/xo)
    if ac < a:
        intersect = True
    else:
        intersect = False

    return intersect


def plot_circle(f, r, x, y, li, ns, lp, stype):
    """
    Plots circles.

    Parameters:
    -----------
    f: file object
    r: float
        circle radius
    x: float
        center of the circle x coordinate
    y: float
        center of the circle y coordinate
    li: int
        number of lines
    ns: int
        number of surfaces
    lp:
        list of points
    stype: dictionary
        key='circle', 'up_arc', 'low_arc', or 'central' value=index
        of the lines

    returns:
    --------
    li, ns, lp, stype
    """

    f.write("Circle("+ str(li) +") = { "+ str(x) +", "+ str(y) +", 0, "
            + str(r) +", 0, 2*Pi};\n")
    stype['circle'].append(li)
    lp.append(ns)
    li += 1
    ns += 1

    return li, ns, lp, stype


def plot_arc_upper(f, r, x, y, li, ns, lp, stype):
    """
    Plots arc based on the intersection of the line at 90 degrees
    and a circle.

    Parameters:
    -----------
    f: file object
    r: float
        circle radius
    x: float
        center of the circle x coordinate
    y: float
        center of the circle y coordinate
    li: int
        number of lines
    ns: int
        number of surfaces
    lp:
        list of points
    stype: dictionary
        key='circle', 'up_arc', 'low_arc', or 'central' value=index
        of the lines

    returns:
    --------
    li, ns, lp, stype
    """

    alpha = np.pi - mt.acos(x/r)
    f.write("Circle("+ str(li) +") = { "+ str(x) +", "+ str(y) +", 0, "
            + str(r) +", "+ str(-alpha) +", "+ str(alpha) +"};\n")
    stype['up_arc'].append(li)
    points = []
    points.append(ns + 1)
    points.append(ns)
    lp.append(points)
    li += 1
    ns += 2

    return li, ns, lp, stype


def plot_arc_lower(f, r, a, x, y, li, ns, lp, stype):
    """
    Plots arc based on the intersection of the line at a degrees
    and a circle.

    Parameters:
    -----------
    f: file object
    r: float
        circle radius
    a: float
        angle of the lower plane
    x: float
        center of the circle x coordinate
    y: float
        center of the circle y coordinate
    li: int
        number of lines
    ns: int
        number of surfaces
    lp:
        list of points
    stype: dictionary
        key='circle', 'up_arc', 'low_arc', or 'central' value=index
        of the lines

    returns:
    --------
    li, ns, lp, stype
    """

    dy = y - x * np.tan(a)
    d = dy * np.cos(a)  # center-line distance
    alpha = mt.acos(d/r)
    alpha2 = 3./2*np.pi - (alpha - a)   
    alpha1 = -1./2*np.pi + (alpha + a)
    f.write("Circle("+ str(li) +") = { "+ str(x) +", "+ str(y) +", 0, "+ str(r) +", "+ str(alpha1) +", "+ str(alpha2) +"};\n")
    stype['low_arc'].append(li)
    points = []
    points.append(ns)
    points.append(ns + 1)
    lp.append(points)
    li += 1
    ns += 2

    return li, ns, lp, stype


def place_channel(f, r, d_x, d_y, a, col, row, li, ns, type, dict_type, lp, stype):
    """
    Plots circle if the channel is in the geometry. If the circle intersects
    the line at 90 degrees, it plots an 'upper arc'. If the circle intersects
    the line at angle 'a', it plots a 'lower arc'.
    r: radius of the circle
    d_x:
    """

    for j in row:
        for i in col:
            if check_domain(i*d_x, j*d_y, r, a):
                if check_lower(i*d_x, j*d_y, r, a):
                    li, ns, lp, stype = plot_arc_lower(f, r, a, i*d_x, j*d_y, li, ns, lp, stype)
                elif check_upper(i*d_x, j*d_y, r):
                    li, ns, lp, stype = plot_arc_upper(f, r, i*d_x, j*d_y, li, ns, lp, stype)
                else:
                    li, ns, lp, stype = plot_circle(f, r, i*d_x, j*d_y, li, ns, lp, stype)

            if type == 'fuel' or type == 'coolant':
                dict_type[type].append(li)
            else:
                print('Wrong type')
                sys.exit()

    return li, ns, dict_type, lp, stype


def place_central(f, r, a, li, ns, dict_type, lp, stype):
    
    f.write("Circle("+ str(li) +") = { 0, 0, 0, "+ str(r) +", "+ str(a) +", "+ str(np.pi/2) +"};\n")
    stype['central'].append(li)
    points = []
    points.append(ns)
    points.append(ns + 1)
    lp.append(points)
    
    li += 1
    ns += 2

    return li, ns, dict_type, lp, stype


def multiple_channels(f, rc, rf, a, fcp, li, ns, dict_type, lp, stype):
    """
    The channels are defined from left to right and from the bottom to the top.
    To add the side lines, the channels have to be defined that way. Otherwise
    defining the lines would be a mess.

    """

    dx = fcp / 2               # pitch * sin (30 degrees)
    dy = fcp * np.sqrt(3) / 2  # pitch * cos (30 degrees)
    dy = round(dy, 4)
    s = 2 * dy

    # First Row
    row = [1]
    col = [1, 5, 7, 11, 13, 17, 19]
    li, ns, dict_type, lp, stype = place_channel(f, rf, dx, dy, a, col, row, li, ns, 'fuel', dict_type, lp, stype)

    # Second Row
    row = [1]
    col = [0]
    li, ns, dict_type, lp, stype = place_channel(f, rc, fcp, s, a, col, row, li, ns, 'coolant', dict_type, lp, stype)
    col = [1]
    li, ns, dict_type, lp, stype = place_channel(f, rf, fcp, s, a, col, row, li, ns, 'fuel', dict_type, lp, stype)

    # Third Row
    row = [3]
    col = [1]
    li, ns, dict_type, lp, stype = place_channel(f, rf, dx, dy, a, col, row, li, ns, 'fuel', dict_type, lp, stype)
    col = [3]
    li, ns, dict_type, lp, stype = place_channel(f, rc, dx, dy, a, col, row, li, ns, 'coolant', dict_type, lp, stype)

    # Fourth Row
    row = [2]
    col = [0]
    li, ns, dict_type, lp, stype = place_channel(f, rc, fcp, s, a, col, row, li, ns, 'coolant', dict_type, lp, stype)
    col = [1, 2]
    li, ns, dict_type, lp, stype = place_channel(f, rf, fcp, s, a, col, row, li, ns, 'fuel', dict_type, lp, stype)

    # Fifth Row
    row = [5]
    col = [1]
    li, ns, dict_type, lp, stype = place_channel(f, rf, dx, dy, a, col, row, li, ns, 'fuel', dict_type, lp, stype)
    col = [3]
    li, ns, dict_type, lp, stype = place_channel(f, rc, dx, dy, a, col, row, li, ns, 'coolant', dict_type, lp, stype)
    col = [5]
    li, ns, dict_type, lp, stype = place_channel(f, rf, dx, dy, a, col, row, li, ns, 'fuel', dict_type, lp, stype)

    # Sixth Row
    row = [3]
    col = [0]
    li, ns, dict_type, lp, stype = place_channel(f, rc, fcp, s, a, col, row, li, ns, 'coolant', dict_type, lp, stype)
    col = [1, 2]
    li, ns, dict_type, lp, stype = place_channel(f, rf, fcp, s, a, col, row, li, ns, 'fuel', dict_type, lp, stype)
    col = [3]
    li, ns, dict_type, lp, stype = place_channel(f, rc, fcp, s, a, col, row, li, ns, 'coolant', dict_type, lp, stype)
    
    # Seventh Row
    row = [7]
    col = [1]
    li, ns, dict_type, lp, stype = place_channel(f, rf, dx, dy, a, col, row, li, ns, 'fuel', dict_type, lp, stype)
    col = [3]
    li, ns, dict_type, lp, stype = place_channel(f, rc, dx, dy, a, col, row, li, ns, 'coolant', dict_type, lp, stype)
    col = [5, 7]
    li, ns, dict_type, lp, stype = place_channel(f, rf, dx, dy, a, col, row, li, ns, 'fuel', dict_type, lp, stype)

    # Eigth Row
    row = [4]
    col = [0]
    li, ns, dict_type, lp, stype = place_channel(f, rc, fcp, s, a, col, row, li, ns, 'coolant', dict_type, lp, stype)
    col = [1, 2]
    li, ns, dict_type, lp, stype = place_channel(f, rf, fcp, s, a, col, row, li, ns, 'fuel', dict_type, lp, stype)
    col = [3]
    li, ns, dict_type, lp, stype = place_channel(f, rc, fcp, s, a, col, row, li, ns, 'coolant', dict_type, lp, stype)
    col = [4]
    li, ns, dict_type, lp, stype = place_channel(f, rf, fcp, s, a, col, row, li, ns, 'fuel', dict_type, lp, stype)

    # Ninth Row
    row = [9]
    col = [1]
    li, ns, dict_type, lp, stype = place_channel(f, rf, dx, dy, a, col, row, li, ns, 'fuel', dict_type, lp, stype)
    col = [3]
    li, ns, dict_type, lp, stype = place_channel(f, rc, dx, dy, a, col, row, li, ns, 'coolant', dict_type, lp, stype)
    col = [5, 7]
    li, ns, dict_type, lp, stype = place_channel(f, rf, dx, dy, a, col, row, li, ns, 'fuel', dict_type, lp, stype)
    col = [9]
    li, ns, dict_type, lp, stype = place_channel(f, rc, dx, dy, a, col, row, li, ns, 'coolant', dict_type, lp, stype)


    # Tenth Row
    row = [5]
    col = [0]
    li, ns, dict_type, lp, stype = place_channel(f, rc, fcp, s, a, col, row, li, ns, 'coolant', dict_type, lp, stype)
    col = [1, 2]
    li, ns, dict_type, lp, stype = place_channel(f, rf, fcp, s, a, col, row, li, ns, 'fuel', dict_type, lp, stype)
    col = [3]
    li, ns, dict_type, lp, stype = place_channel(f, rc, fcp, s, a, col, row, li, ns, 'coolant', dict_type, lp, stype)
    col = [4, 5]
    li, ns, dict_type, lp, stype = place_channel(f, rf, fcp, s, a, col, row, li, ns, 'fuel', dict_type, lp, stype)

    li, ns, dict_type, lp, stype = place_central(f, rc, a, li, ns, dict_type, lp, stype)

    return li, ns, dict_type, lp, stype


def plot_upper_lines(f, dy, li, ns, lp, stype):

    f.write("Line("+ str(li) +") = { 1, "+ str(lp[stype['central'][-1]][0]) +"};\n")
    f.write("Line("+ str(li+1) +") = { "+ str(lp[stype['central'][-1]][0]) +", "+ str(lp[stype['up_arc'][0]][0]) +"};\n")
    cc = 2
    for i in range(len(stype['up_arc'][:-1])):
        j0 = stype['up_arc'][i]
        j1 = stype['up_arc'][i+1]
        f.write("Line("+ str(li+cc) +") = { "+ str(lp[j0][0]) +", "+ str(lp[j0][1]) +"};\n")
        cc += 1
        f.write("Line("+ str(li+cc) +") = { "+ str(lp[j0][1]) +", "+ str(lp[j1][0]) +"};\n")
        cc += 1
    
    i = stype['up_arc'][-1]
    f.write("Line("+ str(li+cc) +") = { "+ str(lp[i][0]) +", "+ str(lp[i][1]) +"};\n")
    cc += 1
    f.write("Line("+ str(li+cc) +") = { "+ str(lp[i][1]) +", "+ str(lp[stype['mod'][-1]][0]) +"};\n")
    cc += 1
    li += cc

    return li, ns


def plot_lower_lines(f, R, a, li, ns, lp, stype):

    f.write("Line("+ str(li) +") = { 1, "+ str(lp[stype['central'][-1]][1]) +"};\n")
    f.write("Line("+ str(li+1) +") = { "+ str(lp[stype['central'][-1]][1]) +", "+ str(lp[stype['low_arc'][0]][0]) +"};\n")
    cc = 2
    for i in range(len(stype['low_arc'][:-1])):
        j0 = stype['low_arc'][i]
        j1 = stype['low_arc'][i+1]
        f.write("Line("+ str(li+cc) +") = { "+ str(lp[j0][0]) +", "+ str(lp[j0][1]) +"};\n")
        cc += 1
        f.write("Line("+ str(li+cc) +") = { "+ str(lp[j0][1]) +", "+ str(lp[j1][0]) +"};\n")
        cc += 1
    
    i = stype['low_arc'][-1]
    f.write("Line("+ str(li+cc) +") = { "+ str(lp[i][0]) +", "+ str(lp[i][1]) +"};\n")
    cc += 1
    f.write("Line("+ str(li+cc) +") = { "+ str(lp[i][1]) +", "+ str(lp[stype['mod'][-1]][1]) +"};\n")
    cc += 1
    li += cc

    return li, ns


def moderator_lines(f, dx, h, a, li, ns, lp, stype):
    c = dx/2
    d = c/np.sqrt(3)

    f.write("Point(" + str(ns) + ") = { 0, " + str(c) + ", 0, " + str(h) + "};\n")
    f.write("Point(" + str(ns+1) + ") = { " + str(d) + ", " + str(c) + ", 0, " + str(h) + "};\n")
    f.write("Line(" + str(li) + ") = { " + str(ns) + ", " + str(ns+1) + "};\n")
    stype['mod'].append(li)
    points = []
    points.append(ns)
    points.append(ns + 1)
    lp.append(points)  
    li += 1
    ns += 2

    li, ns = plot_lower_lines(f, dx, a, li, ns, lp, stype)
    li, ns = plot_upper_lines(f, dx, li, ns, lp, stype)

    return li, ns, lp, stype


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
    f = open("cut-30B.geo", "w+")

    dx = 36      # Block pitch (flat-to-flat ditance)
    rc = 0.794   # Large cooling channel radius
    rsc = 0.635  # Small cooling channel radius
    rf = 0.6223  # Fuel compact radius

    fcp = 1.88   # Fuel/coolant pitch
    Ha = 79.3    # Fuel assembly height
    stf = 10     # Number of fuel elements piled up
    H = stf*Ha   # Total height of the fuel column

    h = 20.0     # Finite Element Discretization

    a = np.pi/3  # angle of the plane that defines the cut

    li = 1
    ns = 2
    dict_type = {'fuel': [], 'coolant': [], 'moderator': []}
    lp = [0] # list of points
    stype = {'circle':[], 'up_arc':[], 'low_arc':[], 'mod':[], 'central':[]}

    f.write('// Gmsh\n')
    f.write('SetFactory("OpenCASCADE");\n//+\n')
    f.write("Point(1) = { 0, 0, 0, " + str(h) + "};\n")
    li, ns, dict_type, lp, stype = multiple_channels(f, rc, rf, a, fcp, li, ns, dict_type, lp, stype)

    li, ns, lp, stype = moderator_lines(f, dx, h, a, li, ns, lp, stype)

    print(li)
    print(ns)
    print(lp)
    print(stype)

    # print(li, ns)
    #f.write("Point(" + str(ns) + ") = { " + str(0) + ", " + str(0) + ", 0, 1.0};\n")
    #f.write("Point(" + str(ns+1) + ") = { " + str(0) + ", " + str(36*np.sin(a)) + ", 0, 1.0};\n")
    #f.write("Point(" + str(ns+2) + ") = { " + str(36*np.cos(a)) + ", " + str(36*np.sin(a)) + ", 0, 1.0};\n")
    #f.write("Line(" + str(ns) + ")={" + str(ns) + ", " + str(ns+1) + "};\n")
    #f.write("Line(" + str(ns+1) + ")={" + str(ns) + ", " + str(ns+2) + "};\n")

    # c, li, ns = cm.add_lines(f, dx, h)
    # c, li, ns, dict_type = cm.cchannels(f, rc, fcp, c, li, ns, dict_type)
    # c, li, ns, dict_type = cm.fchannels(f, rf, fcp, c, li, ns, dict_type)
    # define_moderator(f, H, h, ns, dict_type)
    # physical_entities(f, H, ns, dict_type)

    f.close()


if __name__ == "__main__":
    main()
