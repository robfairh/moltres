Geometry.CopyMeshingMethod = 1;

Hb = 160;
Hc = 793;
Ht = 120;

F = 18.0;  // Half of flat-to-flat distance
A = F/Cos(Pi/6);
h = 30;

Lb = 30;
Lc = 90;
Lt = 30;

// inner reflector
p = 1;
// Point(p) = {0, 0, 0, h}; p += 1;
x = 0; y = 5*F;
Point(p) = {x, y, 0, h}; p += 1;

x = A/2; y = 5*F;
Point(p) = {x, y, 0, h}; p += 1;
Line(1) = {1, 2};

x += A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(2) = {2, 3};

x += A;
Point(p) = {x, y, 0, h}; p += 1;
Line(3) = {3, 4};

x += A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(4) = {4, 5};

x += A;
Point(p) = {x, y, 0, h}; p += 1;
Line(5) = {5, 6};

x += A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(6) = {6, 7};

x -= A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(7) = {7, 8};

x += A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(8) = {8, 9};

x -= A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(9) = {9, 10};

x += A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(10) = {10, 11};

x += -A + F*Cos(Pi/6); y -= F/2;
Point(p) = {x, y, 0, h}; p += 1;
Line(11) = {11, 12};

Rotate {{0, 0, 1}, {0, 0, 0}, 2*Pi/3} {
  Duplicata { Curve{1}; Curve{2}; Curve{3}; Curve{4}; Curve{5}; Curve{6}; Curve{7}; Curve{8}; Curve{9}; Curve{10}; Curve{11}; }
}

Rotate {{0, 0, 1}, {0, 0, 0}, -2*Pi/3} {
  Duplicata { Curve{1}; Curve{2}; Curve{3}; Curve{4}; Curve{5}; Curve{6}; Curve{7}; Curve{8}; Curve{9}; Curve{10}; Curve{11}; }
}

// fuel
p = 89;
x = 0; y = 9*F;
Point(p) = {x, y, 0, h}; p += 1;

x += A/2; y = 9*F;
Point(p) = {x, y, 0, h}; p += 1;
Line(34) = {89, 90};

x += A/2; y += F;
Point(p) = {x, y, 0, h}; p += 1;
Line(35) = {90, 91};

x += A; y += 0;
Point(p) = {x, y, 0, h}; p += 1;
Line(36) = {91, 92};

x += A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(37) = {92, 93};

x += A; y += 0;
Point(p) = {x, y, 0, h}; p += 1;
Line(38) = {93, 94};

x += A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(39) = {94, 95};

x += A; y += 0;
Point(p) = {x, y, 0, h}; p += 1;
Line(40) = {95, 96};

x += A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(41) = {96, 97};

x += A; y += 0;
Point(p) = {x, y, 0, h}; p += 1;
Line(42) = {97, 98};

x += A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(43) = {98, 99};

x -= A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(44) = {99, 100};

x += A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(45) = {100, 101};

x += A; y += 0;
Point(p) = {x, y, 0, h}; p += 1;
Line(46) = {101, 102};

x += A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(47) = {102, 103};

x -= A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(48) = {103, 104};

x += A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(49) = {104, 105};

x -= A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(50) = {105, 106};

x += A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(51) = {106, 107};

x -= A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(52) = {107, 108};

x += A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(53) = {108, 109};

x -= A/2; y -= F;
Point(p) = {x, y, 0, h}; p += 1;
Line(54) = {109, 110};

x -= A; y -= 0;
Point(p) = {x, y, 0, h}; p += 1;
Line(55) = {110, 111};

x += -A + F*Cos(Pi/6); y -= F/2;
Point(p) = {x, y, 0, h}; p += 1;
Line(56) = {111, 112};

Rotate {{0, 0, 1}, {0, 0, 0}, 2*Pi/3} {
  Duplicata { Curve{34}; Curve{35}; Curve{36}; Curve{37}; Curve{38}; Curve{39}; Curve{40}; Curve{41}; Curve{42}; Curve{43}; Curve{44}; Curve{45}; Curve{46}; Curve{47}; Curve{48}; Curve{49}; Curve{50}; Curve{51}; Curve{52}; Curve{53}; Curve{54}; Curve{55}; Curve{56}; }
}

Rotate {{0, 0, 1}, {0, 0, 0}, -2*Pi/3} {
  Duplicata { Curve{34}; Curve{35}; Curve{36}; Curve{37}; Curve{38}; Curve{39}; Curve{40}; Curve{41}; Curve{42}; Curve{43}; Curve{44}; Curve{45}; Curve{46}; Curve{47}; Curve{48}; Curve{49}; Curve{50}; Curve{51}; Curve{52}; Curve{53}; Curve{54}; Curve{55}; Curve{56}; }
}

// outer reflector
OR = 300;

p = 285;
Point(p) = {0, 0, 0, h}; p += 1;

x = 0; y = OR;
Point(p) = {x, y, 0, h}; p += 1;

x = OR*Cos(Pi/6); y = -OR*Sin(Pi/6);
Point(p) = {x, y, 0, h}; p += 1;
Circle(103) = {286, 285, 287};

Rotate {{0, 0, 1}, {0, 0, 0}, 2*Pi/3} {
  Duplicata { Curve{103}; }
}

Rotate {{0, 0, 1}, {0, 0, 0}, -2*Pi/3} {
  Duplicata { Curve{103}; }
}

Curve Loop(1) = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 1};
Plane Surface(1) = {1};
Curve Loop(2) = {35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 34};
Plane Surface(2) = {1, 2};
Curve Loop(3) = {103, 105, 104};
Plane Surface(3) = {2, 3};

Physical Surface("ref_bot") = {1, 2, 3};

Extrude {0, 0, Hb} {
   Surface{1}; Surface{2}; Surface{3}; 
   Layers{Lb}; Recombine;
}

Physical Volume("breflector") = {1, 2, 3};
Physical Surface("fuel_bot") = {784};

Extrude {0, 0, Hc} {
  Surface{272}; Surface{784}; Surface{1146}; 
  Layers{Lc}; Recombine;
}

Physical Volume("ireflector") = {4};
Physical Volume("fuel") = {5};
Physical Volume("oreflector") = {6};

Physical Surface("fuel_top") = {1825};

Extrude {0, 0, Ht} {
  Surface{1313}; Surface{1825}; Surface{2187}; 
  Layers{Lt}; Recombine;
}

Physical Volume("treflector") = {7, 8, 9};
Physical Surface("ref_top") = {2354, 2866, 3228};
