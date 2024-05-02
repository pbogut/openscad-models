width = 12.4;
height = 7.4;

hold_width = 8;

module hold_hook() {
  translate([5, -17, 34]) {
    hull() {
      translate([0, 12, 0]) {
        translate([0, -12, 0]) sphere(2, $fn = 64);
      }
      translate([hold_width, 12, 0]) {
        translate([0, -12, 0]) sphere(2, $fn = 64);
      }
      translate([0, 12, 8]) {
        translate([0, -13, 0]) sphere(2, $fn = 64);
      }
      translate([hold_width, 12, 8]) {
        translate([0, -13, 0]) sphere(2, $fn = 64);
      }
    }
    hull() {
      translate([0, 12, 0]) {
        translate([0, -12, 0]) sphere(2, $fn = 64);
        rotate(90, [1, 0, 0]) cylinder(h = 12, r = 2, $fn = 64);
      }
      translate([hold_width, 12, 0]) {
        translate([0, -12, 0]) sphere(2, $fn = 64);
        rotate(90, [1, 0, 0]) cylinder(h = 12, r = 2, $fn = 64);
      }
      translate([0, 2, -15]) {
        sphere(2, $fn = 64);
      }
      translate([hold_width, 2, -15]) {
        sphere(2, $fn = 64);
      }
    }
  }
}

hold_hook();
translate([32, 0, 0]) {
  hold_hook();
}

module base() {
  difference() {
    import("./SCUF_Envision_Pro_Dock.stl");

    translate([25, -19.85, -10]) {
      rotate(28, [-1, 0, 0]) {
        hull() {
          translate([(width - height) / 2, 0, 0]) {
            cylinder(h = 80, r = height / 2, $fn = 64);
          }
          translate([-(width - height) / 2, 0, 0]) {
            cylinder(h = 80, r = height / 2, $fn = 64);
          }
        }
      }
    }

    translate([25, 5, 39]) {
      rotate(90, [1, 0, 0]) {
        cylinder(h = 10, r = 2, $fn = 64);
      }
    }
  }
}

module nadstawka() {
  angle = 14;
  correction = -5;
  mid_offset = 9 + correction;
  edge_offset = 6 + correction;
  filet = 2;
  offset_filet_correction = 7.28;
  intersection() {
    import("./SCUF_Envision_Pro_Dock.stl");
    rotate(angle, [-1, 0, 0]) {
      translate([0 + filet, edge_offset + offset_filet_correction, 0]) {
        cylinder(h = 55, r = filet, $fn = 64);
      }
      translate([50 - filet, edge_offset + offset_filet_correction, 0]) {
        cylinder(h = 55, r = filet, $fn = 64);
      }
    }
  }

  difference() {
    import("./SCUF_Envision_Pro_Dock.stl");
    rotate(angle, [-1, 0, 0]) {
      translate([0 + filet, edge_offset + offset_filet_correction, 0]) {
        translate([-2, -3, 0]) {
          cube([filet, filet + 1, 55]);
        }
      }
      translate([50 - filet, edge_offset + offset_filet_correction, 0]) {
        translate([0, -3, 0]) {
          cube([filet, filet + 1, 55]);
        }
      }

      hull() {
        translate([25, mid_offset, 0]) {
          cylinder(h = 55, r = 5);
        }
        translate([0, edge_offset, 0]) {
          cylinder(h = 55, r = 5);
        }
        translate([50, edge_offset, 0]) {
          cylinder(h = 55, r = 5);
        }
        translate([-5, -40, -10]) {
          cube([60, 5, 75]);
        }
      }
    }
  }
}

render() {
  base();
  translate([0, 0, 8]) {
    nadstawka();
  }
}
