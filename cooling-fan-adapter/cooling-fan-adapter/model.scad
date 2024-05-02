$fn = 64;

thickness = 2.4;

width = 120;
depth = 31;
height = 30;

triangle = 24;
triangle_1 = 5;

hole_r = 10;

module trianglethingi() {
  hull() {
    translate([triangle, depth, 0]) {
      cube([triangle_1, thickness, height]);
    }
    translate([0, depth, 0]) {
      cube([triangle_1, thickness, height + triangle]);
    }
  }
}

module box() {
  difference() {
    cube([width, depth + thickness, height]);
    translate([thickness, thickness, thickness]) {
      cube([width - (thickness * 2), depth - (thickness * 2), height]);
    }
    translate([hole_r + 25, 2, height - hole_r]) {
      translate([-hole_r + 3.5, -3, 0]) {
        cube([13, 5, hole_r + 1]);
      }

      rotate(90, [1, 0, 0]) {
        translate([0, 0, -thickness]) {
          cylinder(h = thickness * 3, r = hole_r);
        }
      }
    }
    translate([80, 34.4, -5]) {
      rotate(180, [0, 0, 1]) {
        usbc();
      }
    }
  }
  difference() {
    translate([55, 0, 0]) {
      cube([27, depth - 4, 6]);
    }
    translate([80, 34.4, -5]) {
      rotate(180, [0, 0, 1]) {
        usbc();
      }
    }
  }

  trianglethingi();
  translate([width, 0, 0]) {
    mirror([1, 0, 0]) {
      trianglethingi();
    }
  }
}
// usb-C

module usbc(head = true) {
  translate([10, 1, 10]) {
    if (head) {
      translate([-1, 0, 0]) {
        cube([10, 5, 3.6]);
      }
    }
    translate([-10, 1, -1]) {
      translate([0, 0, -1.6]) {
        cube([23, 5, 5]);
      }
      difference() {
        union() {
          translate([0, 22, -1.6]) {
            cube([23, 7, 5]);
          }
          cube([23, 29, 5]);
        }
        translate([9, 27, -10]) {
          cube([10, 5, 20]);
        }
      }
    }
  }
}

// box();
intersection() {
  box();
  translate([56, 0, 0]) {
    cube([25, 35, 10]);
  }
}
// !usbc();
