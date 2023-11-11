thickness = 1;
base_height = 12;
top_height = 2;

module cover() {
  intersection() {
    difference() {
      translate([0, 0, -top_height]) {
        cube([33, 70, thickness + top_height]);
      }

      translate([0, 0, -1]) {
        translate([66, -75, -top_height]) {
          cylinder(h = base_height + 1, r = 100, $fn = 64);
        }
      }
    }

    translate([68, -76.7, -top_height]) {
      cylinder(h = base_height, r = 150, $fn = 128);
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
      translate([1.2, 2.4, 0]) {
        cube([w, l - 2.4, h + 2]);
      }
      translate([1.2, 1.2, 3]) {
        cube([w, l, h + 2]);
      }
      translate([1.2, 2.2, 3]) {
        cube([w + t + 1, l - 2, h]);
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
  translate([3.6, 56, 0]) {
    cylinder(h = base_height + .6, r = 2, $fn = 64);
  }
}

module side(h = base_height, r = 1.25, gaps = 4) {
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

screen_right_shift = 2.6;

module screen() {
  screen_mount();

  translate([4.6, 21, 0]) {
    cube([16.6, 37, 1 + 1]);
    translate([4, 0, 0]) {
      cube([12.6, 39, 1 + 1]);
    }
  }
}

module screen_mount_diff_right() {
  translate([screen_right_shift, 26, 2]) {
    rotate(90, [0, 1, 0]) {
      cylinder(h = 25 + screen_right_shift, r = 0.6, center = false, $fn = 32);
    }
    translate([0 - screen_right_shift, 30, 0]) {
      rotate(90, [0, 1, 0]) {
        cylinder(h = 27 + screen_right_shift, r = 0.6, center = false, $fn = 32);
      }
    }
  }
}

module screen_mount_diff() {
  translate([1, 26, 2]) {
    rotate(90, [0, 1, 0]) {
      cylinder(h = 25, r = 0.6, center = false, $fn = 32);
    }
    translate([0, 30, 0]) {
      rotate(90, [0, 1, 0]) {
        cylinder(h = 27, r = 0.6, center = false, $fn = 32);
      }
    }
  }
}

module screen_mount() {
  translate([2, 26, 1.6]) {
    translate([-1, 0, -1]) {
      rotate(90, [0, 1, 0]) {
        cylinder(h = 4, r = 2.6, center = false, $fn = 32);
      }
      translate([19.8, 0, 0]) {
        rotate(90, [0, 1, 0]) {
          cylinder(h = 4, r = 2.6, center = false, $fn = 32);
        }
      }
      translate([19.8, 30, 0]) {
        rotate(90, [0, 1, 0]) {
          cylinder(h = 4, r = 2.6, center = false, $fn = 32);
        }
      }
    }
  }
}

module screen_diff_right() {
  translate([screen_right_shift, 0, 0]) screen_diff();
}

module screen_right() {
  translate([screen_right_shift, 0, 0]) screen();
}

module screen_diff() {
  translate([5.6, 22, -0.6]) {
    cube([14.6, 37, 1 + 5]);
    translate([0, 0, -1]) {
      cube([14.6, 3, 3 + 5]);
    }
    translate([1, 4.4, -3]) {
      cube([12.6, 27, 2 + 5]);
    }
  }
}

module left() {
  difference() {
    union() {
      difference() {
        screen();
        screen_diff();
      }
      difference() {
        cover();
        screen_diff();
      }
      difference() {
        holes(h = 5, r = 3);
        translate([0, 0, -1]) {
          holes(h = 10, r = 2);
        }
        translate([0, 0, -top_height - 1]) {
          holes(h = 10, r = 2);
        }
      }
      onoff();
      side();
      corner_cylinder();
    }
    translate([0, 0, -top_height - 1]) {
      onoff(inner = true);
      holes(h = base_height, r = 1.25);
    }
    translate([0, 0, -top_height - thickness]) {
      holes(h = top_height + thickness, r = 2);
    }
    screen_mount_diff();
  }
}

module right() {
  mirror([1, 0, 0]) {
    difference() {
      union() {
        difference() {
          screen_right();
          screen_diff_right();
        }
        difference() {
          cover();
          screen_diff_right();
        }
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
      translate([0, 0, -top_height - 1]) {
        onoff(inner = true);
        holes(h = base_height, r = 1.25);
      }
      translate([0, 0, -top_height - thickness]) {
        holes(h = top_height + thickness, r = 2);
      }
      screen_mount_diff_right();
    }
  }
}

left();
translate([-10, 0, 0]) right();
