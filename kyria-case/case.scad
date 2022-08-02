module original() {
  translate([1448, 23, 93])
    import("./left_case_v3.stl");
}


module cut_hole(x, y) {
  translate([x, y, 0]) {
    translate([0, 0, 3]) {
      cylinder(h=5, r=6);
    }
    cylinder(h=5, r=2, $fn = 32);
  }
}

difference() {
  original();
  cut_hole(27.2, 64.7);
  cut_hole(27.2, 102.7);
  cut_hole(43.7, 105.1);
  cut_hole(103.4, 115.3);
  /* #cut_hole(103.2, 115.1); */
  cut_hole(49.9, 55.4);
  cut_hole(94.1, 56.8);
  cut_hole(138, 38.6);
}
