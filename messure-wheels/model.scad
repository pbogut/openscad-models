$fn=64;

height = 23;

module full() {
  difference() {
    union() {
      cylinder(h=height, r=47);
      translate([0,50,0]) {
        difference() {
          cylinder(h=height, r=5);
          cylinder(h=height+1, r=1.2);
        }
        /* translate([-12, -5, 0]) */
        /*   rotate(13, [0, 0, 1]) */
        /*     cube([3, 15, height]); */
      }
    }

  translate([0, 0, 2.4])
    cylinder(h=height, r=45);
  }
}

module half() {
  difference() {
    full();
    translate([-1, -52.8, 0]) {
      cube([50, 100, 35]);
    }
    translate([-27, -49.4, 0]) {
      rotate(15, [0, 0, -1]) {
        cube([50, 100, 35]);
      }
    }
  }
  rotate(32.9, [0, 0, -1]) {
    translate([0, -47, 0]) {
      cube([1.2, 2, height]);
      translate([0.6, 0, 0]) {
        cylinder(h=height, r=0.6);
      }
    }
  }
  rotate(15, [0, 0, -1]) {
    translate([-50, 0, 0]) {
      cube([10, 5, 2]);
      translate([0, 0, 0]) {
        cube([2, 5, 3]);
        translate([1, 5, 3]) {
          rotate(90, [1, 0, 0]) {
            cylinder(h=5, r=1);
          }
        }
      }
    }
  }
}

module cuthing() {
    translate([-1,47,0]) {
      cube([10, 10, 5]);
      translate([-4, 0, 0]) {
        cube([10, 10, 8]);
      }
    }
}

module left() {
  difference() {
    half();
    cuthing();
    translate([0,0,15]) {
      cuthing();
    }
  }
}

module right() {
  difference() {
    mirror([1,0,0]) {
      half();
    }
    translate([0,0,7.5]) {
      cuthing();
    }
    translate([0,0,22.5]) {
      cuthing();
    }
  }
}

module mesure() {
  difference() {
    cylinder(h=2, r=55);
    cylinder(h=3, r=49);
    translate([-60, 0, 0]) {
      cube([120, 100, 5]);
    }
    translate([48, -50, 0]) {
      cube([120, 100, 5]);
    }
    translate([-51, -63, 0]) {
      rotate(50, [0, 0, 1]) {
        cube([120, 100, 5]);
      }
    }
  }

  for (i = [0 : 1 : 50]) {
    rotate(33+i, [0, 0, 1]) {
      translate([0, -49, 0]) {
        cube([2, 4, 3]);
      }
    }
  }

  for (i = [0 : 2 : 70]) {
    rotate(-32+i, [0, 0, -1]) {
      translate([0, -52, 0]) {
        if (i % 5 == 0) {
          translate([0, -2, 0]) {
            cube([0.4, 5, 3]);
          }
        } else {
          cube([0.4, 3, 2.6]);
        }
      }
    }
  }
}

module mesure2() {
  difference() {
    cylinder(h=2, r=100);
    cylinder(h=3, r=94);
    translate([28, -100, 0]) {
      cube([120, 200, 5]);
    }
    translate([-100, 0, 0]) {
      cube([220, 200, 5]);
    }
    translate([-41, -111, 0]) {
      rotate(68, [0, 0, 1]) {
        cube([121, 100, 5]);
      }
    }
  }

  for (i = [0 : 1 : 35]) {
    rotate(-15.5+i, [0, 0, -1]) {
      translate([0, -97, 0]) {
        if (i % 5 == 0) {
          translate([0, -2, 0]) {
            cube([0.8, 5, 3]);
          }
        } else {
          cube([0.8, 3, 2.6]);
        }
      }
    }
  }

  hull() {
    translate([44, -64, 0]) {
      cylinder(h=2, r=1);
    }
    translate([28, -95, 0]) {
      cylinder(h=2, r=1);
    }
    translate([35, -84, 0]) {
      cylinder(h=2, r=1);
    }
    translate([26, -88, 0]) {
      cylinder(h=2, r=1);
    }
  }
}

/* mesure(); */
translate([0, 48.6, 0])
mesure2();

right();
/* left(); */
translate([-15, 0, 0]) {
  left();
}
