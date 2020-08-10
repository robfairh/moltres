// Gmsh project created on Wed Dec  4 15:19:51 2019
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 1.0};
//+
Point(2) = {0.8, 0, 0, 1.0};
//+
Point(3) = {2.2, 0, 0, 1.0};
//+
Point(4) = {3.2, 0, 0, 1.0};
//+
Point(5) = {3.2, 192, 0, 1.0};
//+
Point(6) = {2.2, 192, 0, 1.0};
//+
Point(7) = {0.8, 192, 0, 1.0};
//+
Point(8) = {0, 192, 0, 1.0};
//+
Line(1) = {1, 2};
//+
Line(2) = {2, 3};
//+
Line(3) = {3, 4};
//+
Line(4) = {4, 5};
//+
Line(5) = {5, 6};
//+
Line(6) = {6, 7};
//+
Line(7) = {7, 8};
//+
Line(8) = {8, 1};
//+
Line(9) = {2, 7};
//+
Line(10) = {6, 3};
//+
Curve Loop(1) = {10, 3, 4, 5};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {9, -6, 10, -2};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {8, 1, 9, 7};
//+
Plane Surface(3) = {3};
//+
Physical Surface("coolant") = {3};
//+
Physical Surface("moderator") = {2};
//+
Physical Surface("fuel") = {1};
//+
Physical Curve("fuel_top") = {5};
//+
Physical Curve("fuel_bottom") = {3};
//+
Physical Curve("coolant_bottom") = {1};
//+
Physical Curve("moderator_bottom") = {2};
//+
Physical Curve("moderator_top") = {6};
//+
Physical Curve("coolant_top") = {7};
