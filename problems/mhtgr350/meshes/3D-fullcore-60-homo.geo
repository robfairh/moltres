Geometry.CopyMeshingMethod = 1;

Hb = 160;
Hc = 793;
Ht = 120;

F = 18.0;  // Half of flat-to-flat distance
A = F/Cos(Pi/6);
h = 10;

Lb = 40;
Lc = 120;
Lt = 40;

// inner reflector
p = 1;
Point(p) = {0, 0, 0, h}; p += 1;
x = 0; y = 5*F;
Point(p) = {x, y, 0, h}; p += 1;
Line(1) = {1, 2};

x = A/2; y = 5*F;
Point(p) = {x, y, 0, h}; p += 1;
Line(2) = {2, 3};

x += A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(3) = {3, 4};

x += A;
Point(p) = {x, y, 0, h}; p += 1;
Line(4) = {4, 5};

x += A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(5) = {5, 6};

x += A;
Point(p) = {x, y, 0, h}; p += 1;
Line(6) = {6, 7};

x += A/4; y -= F/2;
Point(p) = {x, y, 0, h}; p += 1;
Line(7) = {7, 8};
Line(8) = {8, 1};

// fuel
x = 0; y = 9*F;
Point(p) = {x, y, 0, h}; p += 1;
Line(9) = {2, 9};

x += A/2; y = 9*F;
Point(p) = {x, y, 0, h}; p += 1;
Line(10) = {9, 10};

x += A/2; y += F;
Point(p) = {x, y, 0, h}; p += 1;
Line(11) = {10, 11};

x += A; y += 0;
Point(p) = {x, y, 0, h}; p += 1;
Line(12) = {11, 12};

x += A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(13) = {12, 13};

x += A; y += 0;
Point(p) = {x, y, 0, h}; p += 1;
Line(14) = {13, 14};

x += A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(15) = {14, 15};

x += A; y += 0;
Point(p) = {x, y, 0, h}; p += 1;
Line(16) = {15, 16};

x += A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(17) = {16, 17};

x += A; y += 0;
Point(p) = {x, y, 0, h}; p += 1;
Line(18) = {17, 18};

x += A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(19) = {18, 19};

x -= A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(20) = {19, 20};

x += A/4; y -= F/2;
Point(p) = {x, y, 0, h}; p += 1;
Line(21) = {20, 21};
Line(22) = {21, 8};

// outer reflector
OR = 300;

x = 0; y = OR;
Point(p) = {x, y, 0, h}; p += 1;
Line(23) = {9, 22};

x = OR*Cos(Pi/6); y = OR*Sin(Pi/6);
Point(p) = {x, y, 0, h}; p += 1;
Circle(24) = {22, 1, 23};
Line(25) = {23, 21};

Curve Loop(1) = {1, 2, 3, 4, 5, 6, 7, 8};
Plane Surface(1) = {1};
Curve Loop(2) = {9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, -7, -6, -5, -4, -3, -2};
Plane Surface(2) = {2};
Curve Loop(3) = {23, 24, 25, -21, -20, -19, -18, -17, -16, -15, -14, -13, -12, -11, -10};
Plane Surface(3) = {3};

Physical Surface("ref_bot") = {1, 2, 3};

Extrude {0, 0, Hb} {
   Surface{1}; Surface{2}; Surface{3}; 
   Layers{Lb}; Recombine;
}

Physical Volume("breflector") = {1, 2, 3};
Physical Surface("wall1") = {38, 92, 189};
Physical Surface("wall2") = {66, 144, 197};
Physical Surface("wall3") = {193};
Physical Surface("fuel_bot") = {169};

Extrude {0, 0, Hc} {
  Surface{67}; Surface{169}; Surface{246};
  Layers{Lc}; Recombine;
}

Physical Volume("ireflector") = {4};
Physical Volume("fuel") = {5};
Physical Volume("oreflector") = {6};

Physical Surface("wall1") += {259, 313, 410};
Physical Surface("wall2") += {287, 365, 418};
Physical Surface("wall3") += {414};

Physical Surface("fuel_top") = {390};

Extrude {0, 0, Ht} {
  Surface{288}; Surface{390}; Surface{467}; 
  Layers{Lt}; Recombine;
}

Physical Volume("treflector") = {7, 8, 9};

Physical Surface("wall1") += {480, 534, 631};
Physical Surface("wall2") += {508, 586, 639};
Physical Surface("wall3") += {635};
Physical Surface("ref_top") = {509, 611, 688};
