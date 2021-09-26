import("./lace_outer_standing.stl");


translate([-12.33, -6, -7.7]) {
  hull() {
    cube([1.31, 12, 4]);
    translate([0, -0.7, 5]) {
      cube([1.3, 13.4, 0.5]);
    }
  }
}
translate([-18.724, -6, -7.7]) {
  cube([1.6, 12, 5]);
}
