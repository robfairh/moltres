SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 1.0};
//+
Circle(1) = {0, 0, 0, 0.8, 0, Pi/6};
//+
Line(2) = {1, 3};
//+
Line(3) = {2, 1};
//+
Curve Loop(1) = {2, -1, 3};
//+
Plane Surface(1) = {1};
//+
Extrude {0, 0, 20} {
  Surface{1}; Layers{15};
}//+
Physical Volume("coolant") = {1};
//+
Physical Surface("coolant_bottom") = {1};
//+
Physical Surface("coolant_top") = {2};
//+
Physical Surface("side") = {3};
