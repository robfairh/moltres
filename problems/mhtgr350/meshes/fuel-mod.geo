H = 793;
topref = 120; // 120 cm
botref = 160; // 160 cm

// Pitch: distance between coolant and fuel channel.
p = 1.88; // 1.88 cm
px = p * Cos(Pi/6);
py = p * Sin(Pi/6);
rc = 0.794; // Coolant channel radius
rf = 0.635; // Fuel channel radius

// element size (finite element, not fuel element)
h = 10;

SetFactory("OpenCASCADE");
// fuel + moderator + coolant channel
Point(1) = {px, 0, 0, h};
Point(2) = {px, -py, 0, h};
Circle(1) = {0, 0, 0, rc, 11/6*Pi, 2*Pi};
Circle(2) = {px, -py, 0, rf, Pi/2, 5/6*Pi};
Line(3) = {3, 1};
Line(4) = {1, 6};
Line(5) = {4, 5};
Line(6) = {5, 2};
Line(7) = {2, 6};
Curve Loop(1) = {1, 5, 2, -4, -3};
Plane Surface(1) = {1};
Curve Loop(2) = {6, 7, -2};
Plane Surface(2) = {2};
//+
Extrude {0, 0, botref} {
  Surface{1}; Surface{2}; Layers{botref/h}; Recombine;
}
Extrude {0, 0, H} {
  Surface{8}; Surface{11}; Layers{H/h}; Recombine;
}
Extrude {0, 0, topref} {
  Surface{17}; Surface{20}; Layers{topref/h}; Recombine;
}
//+
Physical Volume("moderator") = {1, 3, 5, 2, 6};
Physical Volume("fuel") = {4};
Physical Surface("ref_bot") = {1, 2};
Physical Surface("ref_top") = {26, 29};
Physical Surface("fuel_bot") = {11};
