ang = 8;
distance = 365;

module original() {
  render()
    difference() {
      translate([1448, 23, 93])
        import("./left_case_v3.stl");
      translate([1448, 23, 83])
        import("./left_case_v3.stl");
      translate([0,0,5])
        cube([300,150,50]);
      translate([156.94,50,0]) {
        cube([20,70,10]);
      }
      translate([110,123,0]) {
        rotate(19.5, [0,0,-1]) {
          cube([50,50,10]);
        }
      }
      translate([123,110.4,0]) {
        cube([50,50,10]);
      }
      translate([1,107,0]) {
        rotate(19.5, [0,0,1]) {
          cube([150,30,10]);
        }
      }
      translate([1,128,0]) {
        rotate(5.-3, [0,0,-1]) {
          cube([150,30,10]);
        }
      }
      translate([139,4,0]) {
        rotate(48.-3, [0,0,-1]) {
          cube([20,50,10]);
        }
      }
    }
}

module cut_hole(x, y) {
  translate([x, y, 0]) {
    translate([0, 0, 3])
      cylinder(h=5, r=6);
    cylinder(h=5, r=2, $fn = 32);
  }
}

module half() {
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
}

half();

