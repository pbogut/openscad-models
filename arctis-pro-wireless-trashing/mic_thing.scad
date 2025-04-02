// cylinder(h = 4, r = 20, center = false);
$fn = 64;

module two() {
  difference() {
    cylinder(h = 8, r = 16);
    difference() {
      cylinder(h = 5, r = 11);
      cylinder(h = 5, r = 6);
    }

    translate([-6, 7, 0]) {
      cube([5, 11, 5]);
    }
    translate([6, -9, 0]) {
      cube([11, 5, 5]);
    }
    translate([0, 0, 5.2]) {
      translate([-2, 10.1, 0]) {
        cylinder(h = 5, r = 3);
      }
      // translate([10, 0, 0]) {
      //   cylinder(h = 5, r = 3);
      // }
    }
    cylinder(h = 100, r = 1.5, center = false);
    translate([0, 0, -47]) {
      cylinder(h = 50, r = 4, center = false);
    }
  }
  translate([4, -4, 0]) {
    cube([10, 10, 5]);
  }
  translate([-1, 4, 0]) {
    cube([11, 8, 5]);
  }
}
module one() {
  difference() {
    cylinder(h = 8, r = 16);
    difference() {
      cylinder(h = 5, r = 11);
      cylinder(h = 5, r = 6);
    }

    translate([6, 4, 0]) {
      cube([11, 5, 5]);
    }
    translate([6, -9, 0]) {
      cube([11, 5, 5]);
    }
    translate([0, 0, 5.2]) {
      translate([-2, 10.1, 0]) {
        cylinder(h = 5, r = 3);
      }
      translate([10, 0, 0]) {
        cylinder(h = 5, r = 3);
      }
    }
    cylinder(h = 100, r = 1.5, center = false);
    translate([0, 0, -47]) {
      cylinder(h = 50, r = 4, center = false);
    }
  }
  translate([4, -4, 0]) {
    cube([10, 8, 5]);
  }
}
translate([0, 0, -20]) {
  one();
}
mirror([0, 0, 1]) {
  two();
}
