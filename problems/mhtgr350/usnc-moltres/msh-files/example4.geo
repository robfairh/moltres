// Just a cylinder
SetFactory("OpenCASCADE");
Circle(1) = {0, 0, 0, 0.635, 0, 2*Pi};
//+
Curve Loop(1) = {1};
//+
Plane Surface(1) = {1};
//+
Extrude {0, 0, 793} {
  Surface{1}; Layers{800};
}
//+
Physical Surface("coolant_bottom") = {1};
//+
Physical Surface("coolant_top") = {3};
//+
Physical Surface("side") = {2};
//+
Physical Volume("coolant") = {1};
