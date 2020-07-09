// Gmsh geometry
SetFactory("OpenCASCADE");

Hc = 793;
Lr = 1.0;
Lc = 100; // Axial layers in the core

//+
Circle(1) = { 0.0, 3.256, 0, 0.635, -1.5707963267948966, 1.5707963267948966};
Circle(2) = { 0.0, 6.512, 0, 0.794, -1.5707963267948966, 1.5707963267948966};
Circle(3) = { 0.0, 9.767999999999999, 0, 0.794, -1.5707963267948966, 1.5707963267948966};
Circle(4) = { 0.0, 13.024, 0, 0.794, -1.5707963267948966, 1.5707963267948966};
Circle(5) = { 0.0, 16.279999999999998, 0, 0.794, -1.5707963267948966, 1.5707963267948966};
Circle(6) = { 0.94, 4.8839999999999995, 0, 0.635, 0, 2*Pi};
Circle(7) = { 0.94, 8.139999999999999, 0, 0.635, 0, 2*Pi};
Circle(8) = { 0.94, 11.395999999999999, 0, 0.635, 0, 2*Pi};
Circle(9) = { 0.94, 14.652, 0, 0.635, 0, 2*Pi};
Circle(10) = { 1.88, 3.2559999999999993, 0, 0.635, 1.0473987466542454, 4.188589009328743};
Circle(11) = { 1.88, 6.511999999999999, 0, 0.635, 0, 2*Pi};
Circle(12) = { 1.88, 9.767999999999999, 0, 0.635, 0, 2*Pi};
Circle(13) = { 1.88, 13.024, 0, 0.635, 0, 2*Pi};
Circle(14) = { 1.88, 16.279999999999998, 0, 0.635, 0, 2*Pi};
Circle(15) = { 2.82, 4.8839999999999995, 0, 0.794, 1.0474389097280543, 4.188548846254934};
Circle(16) = { 2.82, 8.139999999999999, 0, 0.794, 0, 2*Pi};
Circle(17) = { 2.82, 11.395999999999999, 0, 0.794, 0, 2*Pi};
Circle(18) = { 2.82, 14.652, 0, 0.794, 0, 2*Pi};
Circle(19) = { 3.76, 6.511999999999999, 0, 0.635, 1.0475999421200375, 4.188387813862951};
Circle(20) = { 3.76, 9.767999999999999, 0, 0.635, 0, 2*Pi};
Circle(21) = { 3.76, 13.024, 0, 0.635, 0, 2*Pi};
Circle(22) = { 3.76, 16.279999999999998, 0, 0.635, 0, 2*Pi};
Circle(23) = { 4.699999999999999, 8.139999999999999, 0, 0.635, 1.047700539858532, 4.188287216124456};
Circle(24) = { 4.699999999999999, 11.395999999999999, 0, 0.635, 0, 2*Pi};
Circle(25) = { 4.699999999999999, 14.652, 0, 0.635, 0, 2*Pi};
Circle(26) = { 5.639999999999999, 9.767999999999999, 0, 0.794, 1.0476802682735715, 4.188307487709417};
Circle(27) = { 5.639999999999999, 13.024, 0, 0.794, 0, 2*Pi};
Circle(28) = { 5.639999999999999, 16.279999999999998, 0, 0.794, 0, 2*Pi};
Circle(29) = { 6.579999999999998, 11.395999999999999, 0, 0.635, 1.0479017353518083, 4.18808602063118};
Circle(30) = { 6.579999999999998, 14.652, 0, 0.635, 0, 2*Pi};
Circle(31) = { 7.519999999999998, 13.024, 0, 0.635, 1.0480023331086277, 4.187985422874361};
Circle(32) = { 7.519999999999998, 16.279999999999998, 0, 0.635, 0, 2*Pi};
Circle(33) = { 8.459999999999997, 14.652, 0, 0.794, 1.0479216268472067, 4.188066129135782};
Circle(34) = { 9.399999999999997, 16.279999999999998, 0, 0.635, 1.0482035286477185, 4.1877842273352694};
Point(49) = { 0, 18.0, 0, Lr};
Point(50) = { 10.392304845413264, 18.0, 0, Lr};
Line(35) = { 49, 50};
Point(51) = { 0, 0, 0, Lr};
Line(36) = { 15, 16};
Line(37) = { 16, 21};
Line(38) = { 21, 22};
Line(39) = { 22, 26};
Line(40) = { 26, 27};
Line(41) = { 27, 31};
Line(42) = { 31, 32};
Line(43) = { 32, 35};
Line(44) = { 35, 36};
Line(45) = { 36, 39};
Line(46) = { 39, 40};
Line(47) = { 40, 42};
Line(48) = { 42, 43};
Line(49) = { 43, 45};
Line(50) = { 45, 46};
Line(51) = { 46, 47};
Line(52) = { 47, 48};
Line(53) = { 48, 50};
Line(54) = { 15, 51};
Line(56) = { 2, 1};
Line(57) = { 1, 4};
Line(58) = { 4, 3};
Line(59) = { 3, 6};
Line(60) = { 6, 5};
Line(61) = { 5, 8};
Line(62) = { 8, 7};
Line(63) = { 7, 10};
Line(64) = { 10, 9};
Line(65) = { 9, 49};
Line(66) = { 2, 51};

//+
Curve Loop(1) = {1, 56};
Plane Surface(1) = {1};
Curve Loop(2) = {2, 58};
Plane Surface(2) = {2};
Curve Loop(3) = {3, 60};
Plane Surface(3) = {3};
Curve Loop(4) = {4, 62};
Plane Surface(4) = {4};
Curve Loop(5) = {5, 64};
Plane Surface(5) = {5};
Curve Loop(6) = {6};
Plane Surface(6) = {6};
Curve Loop(7) = {7};
Plane Surface(7) = {7};
Curve Loop(8) = {8};
Plane Surface(8) = {8};
Curve Loop(9) = {9};
Plane Surface(9) = {9};
Curve Loop(10) = {10, -36};
Plane Surface(10) = {10};
Curve Loop(11) = {11};
Plane Surface(11) = {11};
Curve Loop(12) = {12};
Plane Surface(12) = {12};
Curve Loop(13) = {13};
Plane Surface(13) = {13};
Curve Loop(14) = {14};
Plane Surface(14) = {14};
Curve Loop(15) = {15, -38};
Plane Surface(15) = {15};
Curve Loop(16) = {16};
Plane Surface(16) = {16};
Curve Loop(17) = {17};
Plane Surface(17) = {17};
Curve Loop(18) = {18};
Plane Surface(18) = {18};
Curve Loop(19) = {19, -40};
Plane Surface(19) = {19};
Curve Loop(20) = {20};
Plane Surface(20) = {20};
Curve Loop(21) = {21};
Plane Surface(21) = {21};
Curve Loop(22) = {22};
Plane Surface(22) = {22};
Curve Loop(23) = {42, -23};
Plane Surface(23) = {23};
Curve Loop(24) = {24};
Plane Surface(24) = {24};
Curve Loop(25) = {25};
Plane Surface(25) = {25};
Curve Loop(26) = {26, -44};
Plane Surface(26) = {26};
Curve Loop(27) = {27};
Plane Surface(27) = {27};
Curve Loop(28) = {28};
Plane Surface(28) = {28};
Curve Loop(29) = {29, -46};
Plane Surface(29) = {29};
Curve Loop(30) = {30};
Plane Surface(30) = {30};
Curve Loop(31) = {31, -48};
Plane Surface(31) = {31};
Curve Loop(32) = {32};
Plane Surface(32) = {32};
Curve Loop(33) = {33, -50};
Plane Surface(33) = {33};
Curve Loop(34) = {52, -34};
Plane Surface(34) = {34};
Curve Loop(35) = {66, -54, 10, 37, 15, 39, 19, 41, 23, 43, 26, 45, 29, 47, 31, 49, 33, 51, 34, 53, -35, -65, 5, -63, 4, -61, 3, -59, 2, -57, 1};
Curve Loop(36) = {6};
Curve Loop(37) = {7};
Curve Loop(38) = {8};
Curve Loop(39) = {9};
Curve Loop(40) = {11};
Curve Loop(41) = {12};
Curve Loop(42) = {13};
Curve Loop(43) = {14};
Curve Loop(44) = {16};
Curve Loop(45) = {17};
Curve Loop(46) = {18};
Curve Loop(47) = {22};
Curve Loop(48) = {20};
Curve Loop(49) = {21};
Curve Loop(50) = {24};
Curve Loop(51) = {25};
Curve Loop(52) = {27};
Curve Loop(53) = {28};
Curve Loop(54) = {30};
Curve Loop(55) = {32};
Plane Surface(35) = {35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55};

//+
Physical Surface("fuel_bot") = {
	6, 7, 8, 9, 10, 11, 12, 13, 14, 19,
	20, 21, 22, 23, 24, 25, 29, 30, 31,
	32, 34
};
Physical Surface("cool_bot") = {
	1, 2, 3, 4, 5, 15, 16, 17, 18, 26,
	27, 28, 33
};

Physical Surface("moder_bot") = {35};

bcool_vol[] = {};
For index In {1:5}
	Extrude {0, 0, Hc} { Surface{index}; Layers{Lc}; Recombine; }
	bcool_vol += {index};
EndFor

bfuel_vol[] = {};
For index In {6:14}
	Extrude {0, 0, Hc} { Surface{index}; Layers{Lc}; Recombine; }
	bfuel_vol += {index};
EndFor

For index In {15:18}
	Extrude {0, 0, Hc} { Surface{index}; Layers{Lc}; Recombine; }
	bcool_vol += {index};
EndFor

For index In {19:25}
	Extrude {0, 0, Hc} { Surface{index}; Layers{Lc}; Recombine; }
	bfuel_vol += {index};
EndFor

For index In {26:28}
	Extrude {0, 0, Hc} { Surface{index}; Layers{Lc}; Recombine; }
	bcool_vol += {index};
EndFor

For index In {29:32}
	Extrude {0, 0, Hc} { Surface{index}; Layers{Lc}; Recombine; }
	bfuel_vol += {index};
EndFor

index = 33;
Extrude {0, 0, Hc} { Surface{index}; Layers{Lc}; Recombine; }
bcool_vol += {index};

index = 34;
Extrude {0, 0, Hc} { Surface{index}; Layers{Lc}; Recombine; }
bfuel_vol += {index};

index = 35;
Extrude {0, 0, Hc} { Surface{35}; Layers{Lc}; Recombine; }

Physical Volume("fuel") = { bfuel_vol[] };
Physical Volume("coolant") = { bcool_vol[] };
Physical Volume("moderator") = { 35 };

Physical Surface("fuel_top") = {
	52, 54, 56, 58, 61, 63, 65, 67, 69, 81,
	83, 85, 87, 89, 90, 92, 94, 104, 106, 109,
	111, 117
};

Physical Surface("cool_top") = {
	38, 41, 44, 47, 50, 72, 74, 76, 78, 97,
	99, 101, 114
};

Physical Surface("moder_top") = {169};
