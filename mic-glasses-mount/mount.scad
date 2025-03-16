thickness = 1.2;
cube([50, 1, 1 + thickness]);
translate([0, 0, 0]) {
  difference() {
    cube([50, 15, thickness]);
    translate([0, 2, 0]) {
      cube([25, 5, 5]);
    };
  }
}
hull() {
  translate([50 - 5, 15 - 5, 0]) {
    cube([5, 5, thickness]);
  };
  translate([0, 98.6 - 5, 0]) {
    cube([5, 5, thickness]);
  };
}
hull() {
  translate([0, 15, 0]) {
    cube([5, 5, thickness]);
  };
  translate([0, 95 - 5, 0]) {
    cube([5, 5, thickness]);
  };
}
hull() {
  translate([2, 100 - 4, 1]) {
    cylinder(h = thickness, r = 4, center = true);
  };
  translate([-70, 100 - 4, 1]) {
    cylinder(h = thickness, r = 4, center = true);
  };
}
