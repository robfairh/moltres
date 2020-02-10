// The gas gap and the pellet are homogenized.
h = 1; // element size
H = 793;
topref = 120;
botref = 160;
Htop = H + topref;
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
Extrude {0, 0, H} {
  Surface{1}; Surface{3}; Surface{2}; Layers{H/h}; Recombine;
}

// Top reflector
Point(15) = {0, 0, Htop, h};
Point(16) = {1.63, 0, Htop, h};
Point(17) = {1.63, -0.94, Htop, h};
Circle(26) = {0, 0, Htop, 0.794, 11/6*Pi, 2*Pi};
Line(27) = {15, 18};
Line(28) = {18, 16};
Line(29) = {16, 17};
Line(30) = {17, 19};
Line(31) = {19, 15};
Line(32) = {9, 15};
Line(33) = {8, 19};
Line(34) = {10, 18};
Line(35) = {12, 16};
Line(36) = {14, 17};
Curve Loop(16) = {31, 27, 26};
Plane Surface(16) = {16};
Curve Loop(17) = {30, -26, 28, 29};
Plane Surface(17) = {17};
Curve Loop(18) = {33, -26, -34, 15};
Surface(18) = {18};
Curve Loop(20) = {33, 31, -32, -12};
Plane Surface(19) = {20};
Curve Loop(21) = {34, -27, -32, 14};
Plane Surface(20) = {21};
Curve Loop(22) = {36, -29, -35, 21, 25};
Plane Surface(21) = {22};
Curve Loop(23) = {36, 30, -33, -17, -24};
Surface(22) = {23};
Curve Loop(25) = {35, -28, -34, 19};
Plane Surface(23) = {25};
Surface Loop(4) = {19, 16, 20, 18, 7};
Volume(4) = {4};
Surface Loop(5) = {22, 21, 17, 23, 18, 15, 12};
Volume(5) = {5};

// Bottom reflector
Point(20) = {0, 0, Hbot, h};
Point(21) = {1.63, 0, Hbot, h};
Point(22) = {1.63, -0.94, Hbot, h};
Circle(37) = {0, 0, Hbot, 0.794, 11/6*Pi, 2*Pi};
Line(38) = {20, 23};
Line(39) = {23, 21};
Line(40) = {21, 22};
Line(41) = {22, 24};
Line(42) = {24, 20};
Line(43) = {1, 20};
Line(44) = {5, 24};
Line(45) = {4, 23};
Line(46) = {2, 21};
Line(47) = {3, 22};
Curve Loop(26) = {42, 38, 37};
Plane Surface(24) = {26};
Curve Loop(27) = {41, -37, 39, 40};
Plane Surface(25) = {27};
Curve Loop(28) = {44, -37, -45, 1};
Surface(26) = {28};
Curve Loop(30) = {44, 42, -43, -9};
Plane Surface(27) = {30};
Curve Loop(31) = {43, 38, -45, -3};
Plane Surface(28) = {31};
Curve Loop(32) = {47, 41, -44, -8, -7};
Surface(29) = {32};
Curve Loop(34) = {45, 39, -46, -4};
Plane Surface(30) = {34};
Curve Loop(35) = {47, -40, -46, 5, 6};
Plane Surface(31) = {35};
Surface Loop(6) = {27, 24, 28, 26, 1};
Volume(6) = {6};
Surface Loop(7) = {29, 25, 30, 31, 2, 3, 26};
Volume(7) = {7};

//+
Physical Surface("fuel_top") = {15};
Physical Surface("fuel_bottom") = {2};
Physical Surface("coolant_top") = {7};
Physical Surface("coolant_bottom") = {1};
Physical Surface("moderator_bottom") = {3};
Physical Surface("moderator_top") = {12};
Physical Volume("fuel") = {3};
//Physical Volume("coolant") = {1, 4, 6};
//Physical Volume("moderator") = {2, 5, 7};
//+
Physical Surface("reflector_top") = {17};
Physical Surface("reflector_bottom") = {25};
Physical Surface("coolant_ref_bottom") = {24};
Physical Surface("coolant_ref_top") = {16};
//+
Physical Volume("coolant") = {1, 4, 6};
//+
Physical Volume("moderator") = {2, 5, 7};
