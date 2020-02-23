//+
SetFactory("OpenCASCADE");
Circle(1) = {0, 0, 0, 1, 0, 2*Pi};
//+
Curve Loop(1) = {1};
//+
Plane Surface(1) = {1};
//+
Extrude {0, 0, 10} {
  Surface{1}; Layers{5}; Recombine;
}
//+
Physical Surface("fuel_bot") = {1};
//+
Physical Surface("fuel_top") = {3};
//+
Physical Volume("fuel") = {1};
