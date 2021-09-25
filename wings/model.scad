$fn = 32;
/* linear_extrude(height = 10, center = true, convexity = 10) */
/*    import (file = "wings.svg"); */


thickness = 2;

difference() {
  union() {
    cylinder(h=4, r=5.5);
    intersection() {
      hull() {
        cylinder(h=thickness, r=5.5);
        translate([0, 13.5, 0]) {
          cylinder(h=thickness, r=3.5);
        }
        translate([45, -10, 0]) {
          cylinder(h=thickness, r=3.5);
        }
        translate([20, 15, 0]) {
          cylinder(h=thickness, r=3.5);
        }
        /* translate([25, 10, 0]) { */
        /*   cylinder(h=thickness, r=3.5); */
        /* } */
        /* translate([40, 4, 0]) { */
        /*   cylinder(h=thickness, r=3.5); */
        /* } */
      }
      translate([-21.0, -80.1, 0]) {
        cylinder(h=thickness, r=100, $fn=128);
      }
    }
  }
  cylinder(h=thickness*2, r=2);
  translate([0, 13.5, 0]) {
    cylinder(h=thickness*2, r=1.5);
  }
}
