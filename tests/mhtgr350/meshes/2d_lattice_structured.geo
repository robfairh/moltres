Geometry.CopyMeshingMethod = 1;
R = 72.5;
H = 30;
num_segments = 14;
pitch = R / num_segments;
x = .237952211;
fuel_rad = x * pitch;
graph_rad = pitch;
lc = 1;
lx = .4;
ly = 3;

Point(1) = {0, 0, 0, lc};
Point(2) = {fuel_rad, 0, 0, lc};
Point(3) = {graph_rad, 0, 0, lc};
Point(4) = {0, H, 0, lc};
Point(5) = {fuel_rad, H, 0, lc};
Point(6) = {graph_rad, H, 0, lc};
// fuel top
Line(1) = {4, 5};
// graph top
Line(2) = {5, 6};
// graph right edge
Line(3) = {6, 3};
// graph bottom
Line(4) = {3, 2};
// fuel bottom
Line(5) = {1, 2};
// fuel-graph interface
Line(6) = {2, 5};
// fuel left edge
Line(7) = {4, 1};

// Fuel
Line Loop(8) = {1, -6, -5, -7};
Plane Surface(9) = {8};

// Moderator
Line Loop(10) = {2, 3, 4, 6};
Plane Surface(11) = {10};

// Structured
Transfinite Line{1, 5} = fuel_rad/lx;
Transfinite Line{2, 4} = (graph_rad - fuel_rad)/lx;
Transfinite Line{3, 6, 7} = H/ly;
Transfinite Surface{9};
Transfinite Surface{11};
Recombine Surface{9};
Recombine Surface{11};