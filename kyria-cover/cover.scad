thickness = 1;

module cover() {
  intersection() {
    difference() {
      cube([33, 66, thickness]);

      translate([0, 0, -1]) {
        translate([66, -75, 0]) {
          cylinder(h = (2 * thickness) + 1, r = 100, $fn = 64);
        }
      }
    }

    translate([68, -79.7, 0]) {
      cylinder(h = 5, r = 150, $fn = 128);
    }
  }
}

module holes(h = 5, r = 1.25) {
  translate([4, 7.2, 0]) {
    cylinder(h = h, r = r, $fn = 64);
    translate([25.5, 15, 0]) {
      cylinder(h = h, r = r, $fn = 64);
    }
  }
}

module onoff(h = 5, l = 9, w = 1.75, t = 1.2, gap = 2, topgap = 2.5, inner = false) {
  translate([0, 42.6, 0]) {
    if (inner) {
      translate([t - 5, t + (topgap / 2), -1]) {
        cube([w + 5, l - topgap, h - 1]);
      }
    } else {
      difference() {
        cube([w + (2 * t), l + (2 * t), h]);
        translate([t, t, -1]) {
          cube([w, l, h + 2]);
        }
        translate([t, t + 1, thickness + gap]) {
          cube([w + t + 1, l - 2, h]);
        }
      }
    }
  }
}

module corner_cylinder(h = 5, l = 9, w = 1.75, t = 1.2, gap = 2, topgap = 2.5, inner = false) {
  translate([7, 55, 0]) {
    cylinder(h = 12 + .6, r = 2, $fn = 64);
  }
}

module side(h = 12, r = 1.25, gaps = 4) {
  translate([0, 4, 0]) {
    difference() {
      cube([0.8, 50, h]);
      translate([-1, 0, h - gaps]) {
        translate([0, 8, -1]) {
          cube([3, 7, gaps + 1]);
        }
        translate([0, 20, 0]) {
          cube([3, 9, gaps]);
        }
      }
    }
  }
}

module side_right(h = 12, r = 1.25, gaps = 4) {
  translate([0, 4, 0]) {
    difference() {
      cube([0.8, 50, h]);
      translate([-1, 0, h - gaps]) {
        translate([0, 10, -1]) {
          cube([3, 7, gaps + 1]);
        }
        translate([0, 20, 0]) {
          cube([3, 9, gaps]);
        }
      }
    }
  }
}

module left() {
  difference() {
    union() {
      cover();
      difference() {
        holes(h = 5, r = 3);
        translate([0, 0, -1]) {
          holes(h = 10, r = 2);
        }
      }
      onoff();
      side();
      corner_cylinder();
    }
    translate([0, 0, -1]) {
      onoff(inner = true);
      holes(h = 5, r = 1.25);
    }
  }
}

module right() {
  mirror([1, 0, 0]) {
    difference() {
      union() {
        cover();
        difference() {
          holes(h = 5, r = 3);
          translate([0, 0, -1]) {
            holes(h = 10, r = 2);
          }
        }
        onoff();
        side_right();
        corner_cylinder();
      }
      translate([0, 0, -1]) {
        onoff(inner = true);
        holes(h = 5, r = 1.25);
      }
    }
  }
}

right();
