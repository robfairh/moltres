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
Extrude {0, 0, 10} {
  Surface{1}; Surface{2}; Layers{5}; Recombine;
}
//+
Physical Surface("fuel_bottoms") = {1};
//+
Physical Surface("moder_bottoms") = {2};
//+
Physical Surface("moder_tops") = {11};
//+
Physical Surface("fuel_tops") = {7};
//+
Physical Surface("outer_wall") = {9};
//+
Physical Volume("fuel") = {1};
//+
Physical Volume("moder") = {2};
//+
Extrude {1, 0, 0} {
  Surface{11}; Layers{5}; Recombine;
}
