"""
Definition of common functions used by the .geo generators.
"""

import numpy as np
import math as mt
import random as rd


def add_lines(f, d_x):
    """
    Adds boundary lines of the fuel assembly.

    Parameters:
    -----------
    f: file object
    d_x: float
        block pitch (flat-to-flat ditance)

    returns:
    --------
    c: int
        number of lines
    li: int
        number of line/curved loops
    ns: int
        number of surfaces
    """

    f.write("//+\n")
    f.write("SetFactory('OpenCASCADE');\n")
    f.write("// Define Points of the assembly boundaries \n")

    d0 = d_x / 2
    d1 = d_x / np.sqrt(3)
    d1 = round(d1, 4)
    d2 = d_x / 2 / np.sqrt(3)
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
    """
    Places circles of a given radius at given coordinates.

    Parameters:
    -----------
    f: file object
    r: float
        radius of the circle
    d_x: float
        pitch between circles on the x-direction
    d_y: float
        pitch between circles on the y-direction
    col: int
        index of columns where to place the circles
    row: int
        index of rows where to place the circles
    c: int
        number of lines
    li: int
        number of line/curved loops
    ns: int
        number of surfaces
    type: string
        'fuel' or 'coolant'
    dict_type: dictionary
        key='fuel' or 'coolant', value=index of the surfaces

    returns:
    --------
    c: int
        number of lines
    li: int
        number of line/curved loops
    ns: int
        number of surfaces
    dict_type: dictionary
        key='fuel' or 'coolant', value=index of the surfaces
    """

    for j in row:
        cc = 0
        for i in col:
            f.write("Circle(" + str(cc + c) + ") = { " + str(i*d_x)
                    + ", " + str(j*d_y) + ", 0, " + str(r) + ", 0, 2*Pi};\n")
            f.write("Curve Loop(" + str(li) + ") = {" + str(cc + c) + "};\n")
            f.write("Plane Surface(" + str(ns) + ") = {" + str(li) + "};\n")

            if type == 'fuel' or type == 'coolant':
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
    """
    Places all the cooling channels.

    Parameters:
    -----------
    f: file object
    rc: float
        coolant channel radius
    fcp: float
        fuel-to-coolant channel pitch
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
    c: int
        number of lines
    li: int
        number of line/curved loops
    ns: int
        number of surfaces
    dict_type: dictionary
        key='fuel' or 'coolant', value=index of the surfaces
    """

    dx = fcp / 2               # pitch * sin (30 degrees)
    dy = fcp * np.sqrt(3) / 2  # pitch * cos (30 degrees)
    dy = round(dy, 4)
    s = 2 * dy

    # from the center to the top
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

    return c, li, ns, dict_type


def fchannels(f, rf, fcp, c, li, ns, dict_type):
    """
    Places all the fuel channels.

    Parameters:
    -----------
    f: file object
    rf: float
        fuel channel radius
    fcp: float
        fuel-to-coolant channel pitch
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
    c: int
        number of lines
    li: int
        number of line/curved loops
    ns: int
        number of surfaces
    dict_type: dictionary
        key='fuel' or 'coolant', value=index of the surfaces
    """

    dx = fcp / 2               # pitch * sin (30 degrees)
    dy = fcp * np.sqrt(3) / 2  # pitch * cos (30 degrees)
    dy = round(dy, 4)
    s = 2 * dy

    # from the center to the top
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

    return c, li, ns, dict_type
