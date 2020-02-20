//+
SetFactory('OpenCASCADE');
// Define Points of the assembly boundaries 
Point(1) = { 10.3923, 18.0, 0, 1.0};
Point(2) = { 20.7846, 0, 0, 1.0};
Point(3) = { 10.3923, -18.0, 0, 1.0};
Point(4) = { -10.3923, -18.0, 0, 1.0};
Point(5) = { -20.7846, 0, 0, 1.0};
Point(6) = { -10.3923, 18.0, 0, 1.0};
// Define Lines in the boundary 
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 1};
// Boundary of the assembly 
Curve Loop(1) = {1, 2, 3, 4, 5, 6};
// Defines fuel channel Assembly
Circle(7) = { 0.0, -16.281000000000002, 0, 0.794, 0, 2*Pi};
Curve Loop(2) = {7};
Plane Surface(1) = {2};
Circle(8) = { 0.0, 16.281000000000002, 0, 0.794, 0, 2*Pi};
Curve Loop(3) = {8};
Plane Surface(2) = {3};
Circle(9) = { -0.94, -8.140500000000001, 0, 0.6223, 0, 2*Pi};
Curve Loop(4) = {9};
Plane Surface(3) = {4};
Circle(10) = { 0.94, -8.140500000000001, 0, 0.6223, 0, 2*Pi};
Curve Loop(5) = {10};
Plane Surface(4) = {5};
Circle(11) = { -0.94, 8.140500000000001, 0, 0.6223, 0, 2*Pi};
Curve Loop(6) = {11};
Plane Surface(5) = {6};
Circle(12) = { 0.94, 8.140500000000001, 0, 0.6223, 0, 2*Pi};
Curve Loop(7) = {12};
Plane Surface(6) = {7};
Plane Surface(7) = {1, 2, 3, 4, 5, 6, 7};
//+
Extrude {0, 0, 30} {
  Surface{7};  Surface{1}; Surface{2}; Surface{3}; Surface{4}; Surface{5}; Surface{6}; Layers{10}; Recombine;
}
// Bottom reflector
//+
Extrude {0, 0, -16.0} {
  Surface{7};  Surface{1}; Surface{2}; Surface{3}; Surface{4}; Surface{5}; Surface{6};Layers{10}; Recombine;
}
// Top reflector
//+
Extrude {0, 0, 12.0} {
  Surface{20}; Surface{23}; Surface{24}; Surface{25}; Surface{26}; Surface{21}; Surface{22}; Layers{10}; Recombine;
}
//+
Physical Volume("moderator") = {1};
//+
Physical Volume("coolant") = {2, 3};
//+
Physical Volume("fuel") = {4, 5, 6, 7};
//+
Physical Surface("ref_bot") = {39};
Physical Surface("ref_top") = {58};
Physical Surface("cool_bot") = {40, 41};
Physical Surface("cool_top") = {59, 60};
Physical Surface("fuel_bot") = {3, 4, 5, 6};
