$fn = 64;
ang = 8;
distance = 22;
plate_thickness = 7;
under_magnet_thickness = 0.4;
magnet_thickness = 2.2;
support_height = 3;
screw_separator_thickness = 2.4;
screw_separator_deep = 1.8;

bumps_height = 3;
bumps_clearance = 0.2;

module screw_separators() {
  screw_separator(27.2, 64.7);
  screw_separator(27.2, 102.7);
  screw_separator(43.7, 105.1);
  screw_separator(103.4, 115.3);
  screw_separator(49.9, 55.4);
  screw_separator(94.1, 56.8);
  screw_separator(138, 38.6);
}

module screw_separator(x, y) {
  translate([
    x, y,
    (3 - plate_thickness) + (plate_thickness - screw_separator_thickness - screw_separator_deep)
  ]) {
    difference() {
      cylinder(h = screw_separator_thickness, r = 2, $fn = 32);
      cylinder(h = screw_separator_thickness, r = 1.2, $fn = 32);
    }
  }
}

module fill_hole(x, y) {
  translate([x, y, 0]) {
    translate([0, 0, 3]) {
      cylinder(h = 100, r = 6);
    }
  }
}

module original() {
  import("./trimmed_case.stl");
  translate([94, 57, 0]) {
    cylinder(h = 3, r = 5);
  }
}

module half() {
  scaling_factor = plate_thickness / 3;
  translate([0, 0, 3 - plate_thickness]) {
    scale([1, 1, scaling_factor]) {
      original();
    }
  }
  screw_separators();
  support();
}

module main_left() {
  difference() {
    union() {
      rotate(ang, [0, 0, -1]) {
        half();
      }
    }
    // holes left
    lift_z = plate_thickness - 3;
    translate([0, 0, -lift_z]) {
      translate([23.5, 44, 1.6]) {
        cube([5, 47, 6]);
      }
      translate([20.5, 44, -1.5]) {
        cube([4, 47, 6 + plate_thickness]);
      }
      // for (i = [1:8:45]) {
      //   translate([20.5, 43 + i, -1.5]) {
      //     cube([4, 7, 6]);
      //   }
      // }
    }
  }
}

module main_right() {
  difference() {
    union() {
      translate([346 + distance, 0, 0]) {
        mirror([1, 0, 0]) {
          rotate(ang, [0, 0, -1]) {
            half();
          }
        }
      }
    }
    // holes right
    lift_z = plate_thickness - 3;
    translate([302 + distance, 0, -lift_z]) {
      translate([15.5, 44, 1.6]) {
        cube([5, 47, 6 + plate_thickness]);
      }
      translate([19.5, 44, -1.5]) {
        cube([4, 47, 6 + plate_thickness]);
      }
      // for (i = [1:8:45]) {
      //   translate([19.5, 43 + i, -1.5]) {
      //     cube([4, 7, 6 + plate_thickness]);
      //   }
      // }
    }
  }
}

connector_h = 69;
connector_w = (distance / 2) + 10.5;

hinge_w = 11;
hinge_space = 12.2;

hinge_shift = ((hinge_space - hinge_w) * 1) + hinge_w;
hinge_sth = (hinge_space - hinge_w) / 2;

module connector_left(hinges = true) {
  translate([368, 0, 0]) {
    mirror([1, 0, 0]) {
      connector_right(hinges = hinges);
    }
  }
}

module connector_right(hinges = true) {
  difference() {
    translate([173.1 + (distance / 2), 13, 0]) {
      translate([5, 0, 3 - plate_thickness]) {
        cube([connector_w - 5, connector_h, plate_thickness]);
      }
      translate([0, 0, 3 - plate_thickness]) {
        if (hinges) {
          hull() {
            cube([10, connector_h, 3]);
            cube([4, connector_h, 11]);
          }
          translate([2, connector_h, 11]) {
            rotate(90, [1, 0, 0]) {
              cylinder(h = connector_h, r = 2);
            }
          }
        }
      }
    }
    if (hinges) {
      translate([0.8 + 173.1 + (distance / 2), 6.5 + 13, 6 + 0]) {
        translate([0, 0, 3 - plate_thickness]) {
          rotate(90, [0, 1, 0]) {
            hull() {
              cylinder(h = 2.5, r = 5.25);
              translate([-10, 0, 0]) {
                cylinder(h = 2.5, r = 5.25);
              }
            }
            translate([0, 56, 0]) {
              hull() {
                cylinder(h = 2.5, r = 5.25);
                translate([-10, 0, 0]) {
                  cylinder(h = 2.5, r = 5.25);
                }
              }
            }
          }
        }
        translate([-10, 28, 27]) rotate(90, [0, 1, 0]) cylinder(h = 50, r = 30);
      }
    }
  }
}

module bumps_left() {
  // bumps left
  translate([21.2, 45, 3 - plate_thickness - bumps_height]) {
    translate([-0.7 + 4, bumps_clearance - 1, 3 + 2]) {
      cube([4 - bumps_clearance, 47 - (bumps_clearance * 2), plate_thickness - 2]);
      // % cube([4 - bumps_clearance, 47 - bumps_clearance, plate_thickness - 2]);
    }

    for (i = [1:15.2:45]) {
      translate([0, i, 0]) {
        cube([2, 5, 6]);
        translate([-0.7 + bumps_clearance, -1, bumps_height]) {
          cube([4 - (bumps_clearance * 2), 7, bumps_height]);
          translate([0, 0, 2]) {
            cube([4, 7, plate_thickness - 2]);
          }
        }
        translate([1, 5, 0]) {
          rotate(90, [1, 0, 0]) {
            cylinder(h = 5, r = 1, $fn = 64);
          }
        }
      }
    }
  }
}

module bumps_right() {
  translate([368, 135, 0]) {
    mirror([0, 1, 0]) {
      mirror([1, 0, 0]) {
        bumps_left();
      }
    }
  }
}

module bumps_right2() {
  bumps_clearance = 0.4;
  // bumps_clearance = 0;
  translate([302 + distance, 0, 0]) {
    translate([20.8, 52.5, 1 - bumps_height]) {
      translate([-0.7 + 4, bumps_clearance - 8.5, 3 + 2]) {
        cube([4 - bumps_clearance, 47 - (bumps_clearance * 2), plate_thickness - 2]);
        // % cube([4 - bumps_clearance, 47 - bumps_clearance, plate_thickness - 2]);
      }

      for (i = [1:15:45]) {
        translate([0, i, 0]) {
          cube([2, 5, 6]);
          translate([1, 5, 0]) {
            rotate(90, [1, 0, 0]) {
              cylinder(h = 5, r = 1, $fn = 64);
            }
          }
        }
      }
    }
  }
}

module battery() {
  battery_x = 96;
  battery_y = 62;
  cable_man_x = 46;
  cable_man_y = 48;
  cable_man_shift_x = 6;
  cable_man_shift_y = 8;
  translate([212, 22, 3 - plate_thickness + under_magnet_thickness + magnet_thickness]) {
    rotate(ang, [0, 0, 1]) {
      // battery box
      cube([battery_x, battery_y, plate_thickness]);
      // cable managment
      translate([
        cable_man_shift_x + (battery_x - cable_man_x),
        cable_man_shift_y + (battery_y - cable_man_y), 0
      ]) {
        cube([cable_man_x, cable_man_y, plate_thickness]);
      }
    }
  }
}

module magnets() {
  translate([200, 37, 3 - plate_thickness + under_magnet_thickness]) cube([10, 20, 15]);
  translate([316, 68, 3 - plate_thickness + under_magnet_thickness]) cube([10, 20, 15]);
  translate([258, 57, 3 - plate_thickness + under_magnet_thickness]) cube([10, 20, 15]);
}

module support() {
  translate([91, 38.5, 3]) {
    cylinder(h = support_height, r = 3);
  }
  translate([153.4, 25, 3]) {
    cylinder(h = support_height, r = 3);
  }
  translate([27.4, 47, 3]) {
    cylinder(h = support_height, r = 3);
  }
  translate([154.5, 102.9, 3]) {
    cylinder(h = support_height, r = 3);
  }
  translate([120, 116.1, 3]) {
    cylinder(h = support_height, r = 3);
  }
  translate([9.2, 102.6, 3]) {
    cylinder(h = support_height, r = 3);
  }
  translate([9.2, 46.7, 3]) {
    cylinder(h = support_height, r = 3);
  }
  translate([72, 120.5, 3]) {
    cylinder(h = support_height, r = 3);
  }
}

module left(flat = false, bumps_height = 4) {
  difference() {
    union() {
      connector_left(hinges = !flat);
      main_left();
    }
    translate([368, 0, 0]) {
      mirror([1, 0, 0]) {
        magnets();
        battery();
      }
    }
  }
}

module right(flat = false, bumps_height = 4) {
  difference() {
    union() {
      connector_right(hinges = !flat);
      main_right();
    }
    magnets();
    battery();
  }
}

left();
translate([10, 0, 0]) {
  right();
  bumps_right();
}
bumps_left();
