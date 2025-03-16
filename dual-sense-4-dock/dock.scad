$fn = 128;
height = 50;
length = 244;
width = 50;
base_length = length - width;
lower_cutout = 20;
shell_thickness = 4;
pad_bottom_h = 25;

module ref() {
  translate([60, 100 + 12, -4.1]) {
    rotate(20, [0, 1, 0]) {
      import("./PS5 Charging Dock.stl");
    }
  }
}

module top_curve() {
  translate([-width / 2, 0, height - (width / 4)]) {
    rotate(90, [0, 1, 0]) {
      scale([0.5, 1, 1]) {
        difference() {
          translate([-width, -width / 2, 0]) {
            cube([height + width / 4, width, base_length + width]);
          }
          cylinder(h = base_length + width, r = width / 2);
          translate([0, -width / 2, 0]) {
            cube([height, width, base_length + width]);
          }
        }
      }
    }
  }
}

module main_block() {
  translate([0, width / 2, 0]) {
    difference() {
      union() {
        cylinder(h = height, r = width / 2);
        translate([base_length, 0, 0]) {
          cylinder(h = height, r = width / 2);
        }
        translate([0, -width / 2, 0]) {
          cube([base_length, width, height]);
        }
      }
      top_curve();
    }
  }
}

module insert_block(h) {
  translate([0, width / 2, 0]) {
    difference() {
      union() {
        cylinder(h = h, r = (width / 2) - shell_thickness);
        translate([base_length, 0, 0]) {
          cylinder(h = h, r = (width / 2) - shell_thickness);
        }
        translate([0, -width / 2 + shell_thickness, 0]) {
          cube([base_length, width - shell_thickness * 2, h]);
        }
      }
    }
  }
}

module c(x, y, h, r) {
  translate([x, 0, y]) {
    rotate(-90, [1, 0, 0]) {
      cylinder(h = width * 2, r = r);
    }
  }
}

module pad_cutoff() {
  rotate(5, [0, 1, 0]) translate([40.5 - 6, -26, 50]) {
    hull() {
      c(0.3, 0, h = width * 2, r = 1);
      c(0.1, -22, h = width * 2, r = 1);
      c(-0.3, -24, h = width * 2, r = 1);
      c(-0.72, -25, h = width * 2, r = 1);
      c(-1.35, -26, h = width * 2, r = 1);
      c(-2.5, -27.3, h = width * 2, r = 1);
      c(-3.5, -28.13, h = width * 2, r = 1);
      c(-5, -29.2, h = width * 2, r = 1);
      c(-6.8, -30.2, h = width * 2, r = 1);
      c(-9.1, -31.13, h = width * 2, r = 1);
      c(-11.1, -31.8, h = width * 2, r = 1);
      c(-12.1, -32.1, h = width * 2, r = 1);
      c(-14.1, -32.5, h = width * 2, r = 1);
      c(-18.4, -33.1, h = width * 2, r = 1);
      c(-20.3, -33.3, h = width * 2, r = 1);
      c(-23.3, -28.4, h = width * 2, r = 6);
      c(-28.45, -29, h = width * 2, r = 1);
      c(-28.9, -27, h = width * 2, r = 1);
      c(-29.4, -23, h = width * 2, r = 1);
      c(-30.4, -11, h = width * 2, r = 1);
      c(-31.4, 1, h = width * 2, r = 1);
    }
  }
}

module cable_hole() {
  r = 4.4;
  w = 14;
  guide_r = 5;
  guide_w = 34;
  guide_h = 3;
  translate([20, (width / 2) + r - (w / 2), 0]) {
    hull() {
      cylinder(h = 25, r = r, center = false);
      translate([0, w - (2 * r), 0]) {
        cylinder(h = 25, r = r, center = false);
      }
    }
    hull() {
      translate([0, 0, 0]) {
        rotate(90, [1, 0, 0]) {
          cylinder(h = 25, r = 3.6, center = false);
          translate([0, w - (2 * r) - 1, 0]) {
            cylinder(h = 25, r = 3.6, center = false);
          }
        }
      }
    }
    hull() {
      translate([0, 0, pad_bottom_h - guide_h - 4]) {
        hull() {
          cylinder(h = 0.2, r = r, center = false);
          translate([0, w - (2 * r), 0]) {
            cylinder(h = 0.2, r = r);
          }
        }
      }
      translate([0, -(guide_w - w) / 2, pad_bottom_h - guide_h - 1]) {
        hull() {
          cylinder(h = 0.2, r = guide_r, center = false);
          translate([0, w - (2 * r) + guide_w - w, 0]) {
            cylinder(h = 0.2, r = guide_r, center = false);
          }
        }
      }
    }
  }
}

// render() {
difference() {
  main_block();
  insert_block(pad_bottom_h - 6);
  for (i = [0:3]) {
    translate([i * 55 - (10), 0, -15 + pad_bottom_h]) {
      union() {
        pad_cutoff();
        cable_hole();
      }
    }
  }
}
// }
