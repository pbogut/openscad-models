$fn = 64;
module plate(h = 3.4) {
  x1 = 1;
  x2 = 5;
  y1 = 17;
  y2 = 15;
  y3 = 2;
  ins = 1.6;
  difference() {
    hull() {
      translate([x2, y3, 0]) {
        cylinder(h = h, r = 1);
      }
      translate([x1, y1, 0]) {
        cylinder(h = h, r = 1);
      }
      translate([x2, y2, 0]) {
        cylinder(h = h, r = 1);
      }
      translate([0, 0, 0]) {
        cylinder(h = h, r = 1);
      }
    }
    shift = 0.4;
    translate([0, 0, 0.8]) {
      difference() {
        hull() {
          translate([x2, y3, 0]) {
            cylinder(h = ins, r = 1);
          }
          translate([x1, y1, 0]) {
            cylinder(h = ins, r = 1);
          }
          translate([x2, y2, 0]) {
            cylinder(h = ins, r = 1);
          }
          translate([0, 0, 0]) {
            cylinder(h = ins, r = 1);
          }
        }
        hull() {
          translate([x2 - shift, y3 + shift, 0]) {
            cylinder(h = ins, r = 1);
          }
          translate([x1 + shift, y1 - shift, 0]) {
            cylinder(h = ins, r = 1);
          }
          translate([x2 - shift, y2 - shift, 0]) {
            cylinder(h = ins, r = 1);
          }
          translate([shift, shift, 0]) {
            cylinder(h = ins, r = 1);
          }
        }
      }
    }
  }
}

angle = 35;

module standoff(cut = true) {
  translate([2.86, 8, -5]) {
    intersection() {
      rotate(angle, [-1, 0, 0]) {
        difference() {
          cylinder(h = 10 + 10, r = 2.8);
          if (cut) {
            cylinder(h = 10 + 20, r = 2.1);
          }
        }
      }

      translate([-5, -5, 5]) {
        cube([10, 20, 7]);
      }
    }
  }
}

len = 8;

mirror([1, 0, 0]) {
  intersection() {
    plate(h = 3.4);
    translate([-2, -1, 0]) {
      cube([10, len, 5]);
    }
  }
}
