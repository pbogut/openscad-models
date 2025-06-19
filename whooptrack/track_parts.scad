$fn = 64;

connector_out = 8;
connector_in = 5;
thickness = 3;
width = 10;
length = 165;

module bar() {
  module rounded_cube(v) {
    hull() {
      translate([v[1] / 2, v[1] / 2, 0]) {
        cylinder(h = v[2], r = v[1] / 2);
      }
      translate([v[0] - v[1] / 2, v[1] / 2, 0]) {
        cylinder(h = v[2], r = v[1] / 2);
      }
    }
  }

  difference() {
    union() {
      rounded_cube([length, width, thickness]);
      translate([width / 2, width / 2, 0]) {
        rotate(22.5, [0, 0, 1]) {
          cylinder(center = false, h = thickness, r = connector_out, $fn = 8);
        }
      }
      translate([length - width / 2, width / 2, 0]) {
        rotate(22.5, [0, 0, 1]) {
          cylinder(center = false, h = thickness, r = connector_out, $fn = 8);
        }
      }
    }
    translate([width / 2, width / 2, 0]) {
      rotate(22.5, [0, 0, 1]) {
        cylinder(center = false, h = thickness + 1, r = connector_in, $fn = 8);
      }
    }
    translate([length - width / 2, width / 2, 0]) {
      rotate(22.5, [0, 0, 1]) {
        cylinder(center = false, h = thickness + 1, r = connector_in, $fn = 8);
      }
    }
  }
}

module connector() {
  tolerance = 0.4;
  rotate(22.5, [0, 0, 1]) {
    cylinder(center = false, h = 1, r = connector_out, $fn = 64);
    cylinder(center = false, h = 2 * (thickness + 1), r = connector_in - tolerance, $fn = 8);
  }
}

bar();

translate([10, 30, 0]) {
  connector();
}
