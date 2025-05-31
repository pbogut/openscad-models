module toolkitrc_m7() {
  difference() {
    cube([74, 52, 28]);
    translate([74 - 9, 52 - (25 + 13), 28 - 9]) {
      cube([10, 13, 10]);
    }
    translate([10, 9, 28 - 1]) {
      cube([41, 31, 5]);
    }
  }
  translate([69, 37, 28]) {
    cylinder(r = 3.5, h = 1);
  }
  translate([74 - 9, 52 - (25 + 13), 28 - 9]) {
    translate([4.5, 0, 4.5]) {
      rotate(90, [-1, 0, 0]) {
        cylinder(h = 13, r = 4.5);
      }
    }
  }
}

toolkitrc_m7();
