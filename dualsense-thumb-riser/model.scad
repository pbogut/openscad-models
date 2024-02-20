module riser(_scale = 1) {
  module support() {
    translate([-.5, -8.5, 0]) cube([1, 17, 10]);
    translate([-8.5, -.5, 0]) cube([17, 1, 10]);
  }
  difference() {
    scale([_scale, _scale, 1]) {
      import("./Nacon_Stick_Riser_Right_v6.stl");
      support();
    }
    translate([-25, -25, 0]) {
      cube([50, 50, 6]);
    }
  }
}

riser(1);
/* translate([30, 0, 0]) */
/* riser(0.99); */
/* translate([60, 0, 0]) */
/* riser(0.98); */
/* translate([90, 0, 0]) */
/* riser(0.97); */
