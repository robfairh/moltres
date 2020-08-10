// Gmsh project created on Wed Nov 27 15:07:47 2019
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 1.0};
//+
Point(2) = {1, 0, 0, 1.0};
//+
Point(3) = {2, 0, 0, 1.0};
//+
Point(4) = {2, 1, 0, 1.0};
//+
Point(5) = {1, 1, 0, 1.0};
//+
Point(6) = {0, 1, 0, 1.0};
//+
Line(1) = {1, 2};
//+
Line(2) = {2, 3};
//+
Line(3) = {3, 4};
//+
Line(4) = {2, 5};
//+
Line(5) = {1, 6};
//+
Line(6) = {6, 5};
//+
Line(7) = {5, 4};
//+
Curve Loop(1) = {5, 6, -4, -1};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {2, 3, -7, -4};
//+
Plane Surface(2) = {2};
//+
Physical Surface("fuel") = {1};
//+
Physical Surface("moder") = {2};
//+
Physical Curve("fuel_tops") = {6};
//+
Physical Curve("moder_tops") = {7};
//+
Physical Curve("fuel_bottoms") = {1};
//+
Physical Curve("moder_bottoms") = {2};
//+
Physical Curve("outer_wall") = {3};