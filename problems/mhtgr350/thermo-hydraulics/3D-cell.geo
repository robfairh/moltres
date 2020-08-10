// Just a cylinder
SetFactory("OpenCASCADE");

Rc = 0.794;
Rf = 0.635;
p = 1.88;
f = p*Cos(Pi/6);

h = 2;
Hc = 793;
Lc = 32;

Circle(1) = {0, 0, 0, Rc, 0, 2*Pi};

x = p/2; y = f;
Circle(2) = {x, y, 0, Rf, Pi, Pi+2/3*Pi};

x = p; y = 0;
Circle(3) = {x, y, 0, Rf, Pi-1/3*Pi, Pi+1/3*Pi};

x = p/2; y = -f;
Circle(4) = {x, y, 0, Rf, 1/3*Pi, Pi};

x = -p/2; y = -f;
Circle(5) = {x, y, 0, Rf, 0, 2/3*Pi};

x = -p; y = 0;
Circle(6) = {x, y, 0, Rf, -1/3*Pi, 1/3*Pi};

x = -p/2; y = f;
Circle(7) = {x, y, 0, Rf, 2*Pi-2/3*Pi, 2*Pi};

x = p/2; y = f;
Point(14) = {x, y, 0, h};
x = p; y = 0;
Point(15) = {x, y, 0, h};
x = p/2; y = -f;
Point(16) = {x, y, 0, h};

x = -p/2; y = -f;
Point(17) = {x, y, 0, h};
x = -p; y = 0;
Point(18) = {x, y, 0, h};
x = -p/2; y = f;
Point(19) = {x, y, 0, h};

Line(8) = {14, 3};
Line(9) = {3, 12};
Line(10) = {12, 19};
Line(11) = {19, 13};
Line(12) = {13, 10};
Line(13) = {10, 18};
Line(14) = {18, 11};
Line(15) = {11, 8};
Line(16) = {8, 17};
Line(17) = {17, 9};
Line(18) = {9, 6};
Line(19) = {6, 16};
Line(20) = {16, 7};
Line(21) = {7, 4};
Line(22) = {4, 15};
Line(23) = {15, 5};
Line(24) = {5, 2};
Line(25) = {2, 14};

Curve Loop(1) = {1};
Plane Surface(1) = {1};
Curve Loop(2) = {25, 8, -2};
Plane Surface(2) = {2};
Curve Loop(3) = {10, 11, -7};
Plane Surface(3) = {3};
Curve Loop(4) = {13, 14, -6};
Plane Surface(4) = {4};
Curve Loop(5) = {16, 17, -5};
Plane Surface(5) = {5};
Curve Loop(6) = {19, 20, -4};
Plane Surface(6) = {6};
Curve Loop(7) = {22, 23, -3};
Plane Surface(7) = {7};
Curve Loop(8) = {2, 9, 7, 12, 6, 15, 5, 18, 4, 21, 3, 24};
Curve Loop(9) = {1};
Plane Surface(8) = {8, 9};

Extrude {0, 0, Hc} {
  Surface{1}; Surface{2}; Surface{3}; Surface{4}; 
  Surface{5}; Surface{6}; Surface{7}; Surface{8};
  Layers{Lc}; Recombine;
}

Physical Surface("cool_bottom") = {1};
Physical Surface("fuel_bottom") = {2, 3, 4, 5, 6, 7};
Physical Surface("mod_bottom") = {8};

Physical Volume("coolant") = {1};
Physical Volume("fuel") = {2, 3, 4, 5, 6, 7};
Physical Volume("moderator") = {8};

Physical Surface("cool_top") = {10};
Physical Surface("fuel_top") = {14, 18, 22, 26, 30, 34};
Physical Surface("mod_top") = {41};

Color Green{Surface{10};}
Color Red{Surface{14, 18, 22, 26,30, 34};}
Color Blue{Surface{41};}
