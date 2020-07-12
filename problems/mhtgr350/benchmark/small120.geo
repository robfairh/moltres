Geometry.CopyMeshingMethod = 1;

Hb = 40;  // Bottom reflector height
Hf = 79.3;  // Fuel assembly height
Ht = 40;  // Top reflector height

Lb = 30;  // Number of axial layers in bottom reflector
Lf = 10;  // Number of axial layers in each fuel assembly
Lt = 30;  // Number of axial layers in top reflector

F = 18.0;  // Half of flat-to-flat distance
A = F/Cos(Pi/6);
h = 20;

// 1
p = 1;
Point(p) = {0, 0, 0, h}; p += 1;
Point(p) = {0, F, 0, h}; p += 1;

x = F*Cos(Pi/6); y = -F/2;
Point(p) = {x, y, 0, h}; p += 1;
x = A/2; y = F;
Point(p) = {x, y, 0, h}; p += 1;
x = A; y = 0;
Point(p) = {x, y, 0, h}; p += 1;

l = 1;
Line(l) = {1, 2}; l += 1;
Line(l) = {2, 4}; l += 1;
Line(l) = {4, 5}; l += 1;
Line(l) = {5, 3}; l += 1;
Line(l) = {3, 1}; l += 1;

Curve Loop(1) = {5, 1, 2, 3, 4};
Plane Surface(1) = {1};

// 2 - first half
x = 0; y = F + 1*2*F;
Point(p) = {x, y, 0, h}; p += 1;
x = A/2;
Point(p) = {x, y, 0, h}; p += 1;
x = A; y = 1*2*F;
Point(p) = {x, y, 0, h}; p += 1;

Line(l) = {2, 6}; l += 1;
Line(l) = {6, 7}; l += 1;
Line(l) = {7, 8}; l += 1;
Line(l) = {8, 4}; l += 1;

Curve Loop(2) = {6, 7, 8, 9, -2};
Plane Surface(2) = {2};

// 4, 8, 14, 22, 32, 44, 58, 74 - first half
For index In {1:2}
  Translate {0, index*2*F, 0} {
    Duplicata { Surface{2}; }
  }
EndFor

// 2 - 2nd half
p = 89;
x = A + A;
Point(p) = {x, 0, 0, h}; p += 1;
x = A + A - A/2 + A; y = -F;
Point(p) = {x, y, 0, h}; p += 1;
x = A + A - A/2 + A; y = -F;
Point(p) = {x, y, 0, h}; p += 1;
x = A + A - A/2 + F*Cos(Pi/6); y = -F/2 - F;
Point(p) = {x, y, 0, h}; p += 1;

Line(50) = {5, 89};
Line(51) = {89, 90};
Line(52) = {90, 92};
Line(53) = {92, 3};

Curve Loop(3) = {4, -53, -52, -51, -50};
Plane Surface(46) = {3};

// 5
x = A + A; y = 2*F;
Point(p) = {x, y, 0, h}; p += 1;
x = A + A - A/2 + A; y = -F + 2*F;
Point(p) = {x, y, 0, h}; p += 1;

l = 54;
Line(l) = {8, 93}; l += 1;
Line(l) = {93, 94}; l += 1;
Line(l) = {94, 89}; l += 1;

Curve Loop(4) = {54, 55, 56, -50, -3, -9};
Plane Surface(47) = {4};

// 5, 9, 15, 23, 33, 45, 59, 75
For index In {1:2}
  Translate {0, index*2*F, 0} {
    Duplicata { Surface{47}; }
  }
EndFor

For index In {1:2}
Translate { index*(A+A/2), -index*F, 0} {
  Duplicata {
    Surface{46}; 
    Surface{47};
    Surface{57};
    Surface{61};
  }
}
EndFor

// Physical Surface("ref_bot") = {
//   1, 2, 10, 15, 20, 25, 30, 35, 40, 45,
//   46, 47, 57, 61, 65, 69, 73, 77, 81, 85,
//   89, 95, 102, 109, 116, 123, 130, 137, 144, 151,
//   155, 161, 168, 175, 182, 189, 196, 203, 210, 217,
//   221, 227, 234, 241, 248, 255, 262, 269, 276, 283,
//   287, 293, 300, 307, 314, 321, 328, 335, 342, 349,
//   353, 359, 366, 373, 380, 387, 394, 401, 408, 415,
//   419, 425, 432, 439, 446, 453, 460, 467, 474, 481,
//   485, 491, 498, 505, 512, 519, 526, 533, 540, 547,
//   551, 557, 564, 571, 578, 585, 592, 599, 606, 613
// };

// Goes from 2D to 3D
// Extrude {0, 0, Hb} {
//   Surface{1}; Surface{2}; Surface{10}; Surface{15};  Surface{20};
//   Surface{25}; Surface{30}; Surface{35}; Surface{40}; Surface{45};
//   Surface{46}; Surface{47}; Surface{57}; Surface{61}; Surface{65};
//   Surface{69}; Surface{73}; Surface{77}; Surface{81}; Surface{85};
//   Surface{89}; Surface{95}; Surface{102}; Surface{109}; Surface{116};
//   Surface{123}; Surface{130}; Surface{137}; Surface{144}; Surface{151};
//   Surface{155}; Surface{161}; Surface{168}; Surface{175}; Surface{182};
//   Surface{189}; Surface{196}; Surface{203}; Surface{210}; Surface{217};
//   Surface{221}; Surface{227}; Surface{234}; Surface{241}; Surface{248};
//   Surface{255}; Surface{262}; Surface{269}; Surface{276}; Surface{283};
//   Surface{287}; Surface{293}; Surface{300}; Surface{307}; Surface{314};
//   Surface{321}; Surface{328}; Surface{335}; Surface{342}; Surface{349};
//   Surface{353}; Surface{359}; Surface{366}; Surface{373}; Surface{380};
//   Surface{387}; Surface{394}; Surface{401}; Surface{408}; Surface{415};
//   Surface{419}; Surface{425}; Surface{432}; Surface{439}; Surface{446};
//   Surface{453}; Surface{460}; Surface{467}; Surface{474}; Surface{481};
//   Surface{485}; Surface{491}; Surface{498}; Surface{505}; Surface{512};
//   Surface{519}; Surface{526}; Surface{533}; Surface{540}; Surface{547};
//   Surface{551}; Surface{557}; Surface{564}; Surface{571}; Surface{578};
//   Surface{585}; Surface{592}; Surface{599}; Surface{606}; Surface{613}; 
//   Layers{Lb}; Recombine;
// }

Physical Surface("ref_bot") = {
  1, 2, 10, 15, 46, 47, 57, 61, 65, 71, 78, 85, 89, 95, 102, 109
};

Extrude {0, 0, Hb} {
  Surface{1}; Surface{2}; Surface{10}; Surface{15}; Surface{46};
  Surface{47}; Surface{57}; Surface{61}; Surface{65}; Surface{71};
  Surface{78}; Surface{85}; Surface{89}; Surface{95}; Surface{102};
  Surface{109};
  Layers{Lb}; Recombine;
}

Physical Volume("M221") = {
  1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
};

Physical Surface("wall1") = {126, 149, 176, 203};

Physical Surface("wall2") = {122, 234, 357, 480};

Physical Surface("outerwall") = {
  207, 211, 322, 326, 445, 449, 568, 572, 576, 540, 544, 508, 512, 488, 484
};

Extrude {0, 0, Hf} {
  Surface{139}; Surface{166}; Surface{193}; Surface{220}; Surface{247};
  Surface{279}; Surface{311}; Surface{343}; Surface{370}; Surface{402};
  Surface{434}; Surface{466}; Surface{493}; Surface{525}; Surface{557};
  Surface{589};
  Layers{Lb}; Recombine;
}

Physical Volume("M225") = {17, 18, 22, 21};

Physical Volume("M1") = {19, 23, 27, 26, 25};

Physical Volume("M227") = {20, 24, 28, 32, 31, 30, 29};

Physical Surface("wall1") += {603, 626, 653, 680};

Physical Surface("wall2") += {599, 711, 834, 957};

Physical Surface("outerwall") += {684, 688, 799, 803, 922, 926, 1045, 1049, 1053, 1017, 985, 1021, 989, 965, 961};

Extrude {0, 0, Ht} {
  Surface{616}; Surface{643}; Surface{670}; Surface{697}; Surface{724};
  Surface{756}; Surface{788}; Surface{820}; Surface{847}; Surface{879};
  Surface{911}; Surface{943}; Surface{970}; Surface{1002}; Surface{1034};
  Surface{1066}; 
}

Physical Volume("M228") = {33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48};

Physical Surface("wall1") += {1080, 1103, 1130, 1157};

Physical Surface("wall2") += {1076, 1188, 1311, 1434};

Physical Surface("outerwall") += {1161, 1165, 1276, 1280, 1399, 1403, 1522, 1526, 1530, 1494, 1498, 1462, 1466, 1442, 1438};

Physical Surface("ref_top") = {
  1093, 1120, 1147, 1174, 1201, 1233, 1265, 1297, 1324, 1356, 1388, 1420, 1447, 1479, 1511, 1543
};
