// No top and bottom reflector

Geometry.CopyMeshingMethod = 1;

Rf = 0.635;  // 0.635 cm
Rc = 0.794;  // 0.794 cm
pi = 1.88;  // 1.88 cm
h = .5;

H = 100;

lx = 1;
ly = 1;

R = 0;
Point(1) = {R, 0, 0, h};
Point(2) = {R, H, 0, h};
Line(1) = {1, 2};

R += 2*Rc;
Point(3) = {R, 0, 0, h};
Point(4) = {R, H, 0, h};
Line(2) = {1, 3};
Line(3) = {4, 2};
Line(4) = {3, 4};

Curve Loop(1) = {-1, 2, 3, 4};
Plane Surface(1) = {1};

Transfinite Line{2, 3} = (2*Rc)/lx;
Transfinite Line{1, 4} = H/ly;

Transfinite Surface{1};
Recombine Surface{1};

cool_surfaces[] = {1};
cool_bots[] = {2};
cool_tops[] = {3};

Physical Surface("coolant") = {1};
Physical Line("cool_bot") = {2};
Physical Line("cool_top") = {3};
Physical Line("cool_left") = {1};
Physical Line("cool_right") = {4};