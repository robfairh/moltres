// Gmsh project created on Wed Dec 11 16:11:53 2019
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 1.0};
//+
Point(2) = {1.88, 0, 0, 1.0};
//+
Point(3) = {0.94, 1.63, 0, 1.0};
//+
Circle(1) = {0, 0, 0, 0.635, 0, Pi/3};
//+
Circle(2) = {1.88, 0, 0, 0.794, 2/3*Pi, Pi};
//+
Circle(3) = {0.94, 1.63, 0, 0.635, 4/3*Pi, 5/3*Pi};
//+
Line(4) = {1, 5};
//+
Line(5) = {5, 6};
//+
Line(6) = {6, 2};
//+
Line(7) = {2, 7};
//+
Line(8) = {7, 8};
//+
Line(9) = {8, 3};
//+
Line(10) = {3, 9};
//+
Line(11) = {9, 4};
//+
Line(12) = {4, 1};
//+
Curve Loop(1) = {4, -1, 12};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {6, 7, -2};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {3, -10, -9};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {5, 2, 8, 3, 11, 1};
//+
Plane Surface(4) = {4};
//+
Extrude {0, 0, 79.3} {
  Surface{1}; Surface{4}; Surface{3}; Surface{2}; Layers{10}; Recombine;
}
//+
Physical Surface("fuel_bottom") = {3, 1};
//+
Physical Surface("coolant_bottom") = {2};
//+
Physical Surface("moderator_bottom") = {4};
//+
Physical Surface("moderator_top") = {14};
//+
Physical Surface("fuel_top") = {17, 8};
//+
Physical Surface("coolant_top") = {20};
//+
Physical Volume("fuel") = {3, 1};
//+
Physical Volume("moderator") = {2};
//+
Physical Volume("coolant") = {4};
