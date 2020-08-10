// Gmsh whatever
SetFactory("OpenCASCADE");//+
Circle(1) = {1, 1, 0, 0.5, 0, 2*Pi};
//+
Circle(2) = {3, 1, 0, 0.5, 0, 2*Pi};
//+
Point(3) = {0, 0, 0, 1.0};
//+
Point(4) = {4, 0, 0, 1.0};
//+
Point(5) = {4, 2, 0, 1.0};
//+
Point(6) = {0, 2, 0, 1.0};
//+
Line(3) = {3, 4};
//+
Line(4) = {4, 5};
//+
Line(5) = {5, 6};
//+
Line(6) = {6, 3};
//+
Curve Loop(1) = {6, 3, 4, 5};
//+
Curve Loop(2) = {1};
//+
Curve Loop(3) = {2};
//+
Plane Surface(1) = {1, 2, 3};
//+
Curve Loop(4) = {1};
//+
Plane Surface(2) = {4};
//+
Curve Loop(5) = {2};
//+
Plane Surface(3) = {5};
//+
Extrude {0, 0, 30} {
  Surface{1}; Surface{2}; Surface{3}; Layers{30}; Recombine;
}
//+
Physical Volume("coolant") = {2};
//+
Physical Volume("fuel") = {3};
//+
Physical Volume("moderator") = {1};
//+
Physical Surface("fuel_bottom") = {3};
//+
Physical Surface("fuel_top") = {12};
//+
Physical Surface("moderator_bottom") = {1};
//+
Physical Surface("moderator_top") = {10};
//+
Physical Surface("coolant_top") = {11};
//+
Physical Surface("coolant_bottom") = {2};
