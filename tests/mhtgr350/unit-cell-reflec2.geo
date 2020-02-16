// The gas gap and the pellet are homogenized.
h = 10.; // element size
H = 793;
topref = 120;
botref = 160;
Hbot = - botref;
SetFactory("OpenCASCADE");
// fuel + moderator + coolant channel
Point(1) = {0, 0, 0, h};
Point(2) = {1.63, 0, 0, h};
Point(3) = {1.63, -0.94, 0, h};
Circle(1) = {0, 0, 0, 0.794, 11/6*Pi, 2*Pi};
Circle(2) = {1.63, -0.94, 0, 0.635, Pi/2, 5/6*Pi};
Line(3) = {1, 4};
Line(4) = {4, 2};
Line(5) = {2, 7};
Line(6) = {7, 3};
Line(7) = {3, 6};
Line(8) = {6, 5};
Line(9) = {5, 1};
Curve Loop(1) = {9, 3, 1};
Plane Surface(1) = {1};
Curve Loop(2) = {7, 2, 6};
Plane Surface(2) = {2};
Curve Loop(3) = {8, -1, 4, 5, -2};
Plane Surface(3) = {3};
//+
Extrude {0, 0, Hbot} {
  Surface{1}; Surface{3}; Surface{2}; Layers{Hbot/h}; Recombine;
}
Extrude {0, 0, H} {
  Surface{1}; Surface{3}; Surface{2}; Layers{H/h}; Recombine;
}
Extrude {0, 0, topref} {
  Surface{19}; Surface{24}; Surface{27}; Layers{topref/h}; Recombine;
}
//+
Physical Surface("ref_coolant_top") = {31};
Physical Surface("ref_coolant_bot") = {7};
Physical Surface("reflector_top") = {36, 39};
Physical Surface("reflector_bottom") = {15, 12};
Physical Volume("coolant") = {7, 4, 1};
Physical Volume("moderator") = {9, 8, 5, 2, 3};
Physical Volume("fuel") = {6};
//+
Physical Surface("fuel_bottom") = {2};
