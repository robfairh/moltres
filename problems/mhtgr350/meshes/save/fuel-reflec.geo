H = 793;
topref = 120; // 120 cm
botref = 160; // 160 cm
h = 10;
rf = 0.635;
//+
SetFactory("OpenCASCADE");
Circle(1) = {0, 0, 0, rf, 0, 2*Pi};
//+
Curve Loop(1) = {1};
//+
Plane Surface(1) = {1};
//+
Extrude {0, 0, H} {
  Surface{1}; Layers{H/h}; Recombine;
}
//+
Physical Surface("fuel_bot") = {1};
//+
Physical Surface("fuel_top") = {3};
//+
Physical Volume("fuel") = {1};
//+
Extrude {0, 0, -botref} {
  Surface{1}; Layers{botref/h}; Recombine;
}
//+
Extrude {0, 0, topref} {
  Surface{3}; Layers{topref/h}; Recombine;
}
//+
Physical Surface("ref_top") = {7};
//+
Physical Surface("ref_bot") = {5};
//+
Physical Volume("ref") = {3, 2};
