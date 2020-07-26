// Just a cylinder
SetFactory("OpenCASCADE");

Rc = 0.794;
Hc = 793;
Lc = 32;

Circle(1) = {0, 0, 0, Rc, 0, 2*Pi};

Curve Loop(1) = {1};
Plane Surface(1) = {1};

Extrude {0, 0, Hc} {
  Surface{1}; Layers{Lc};
}

Physical Surface("bottom") = {1};
Physical Surface("top") = {3};
Physical Surface("wall") = {2};

Physical Volume("cool") = {1};
