$fn = 64;
ang = 8;
distance = 23;


// callibration cubes
/* #translate([172.8,3,0]) { */
/*   cube([(distance / 2) + .1,10,10]); */
/*   translate([(distance / 2) +.3,0,0]) */
/*     cube([(distance / 2) + .1,10,10]); */
/* } */


module original() {
  import("./trimmed_case.stl");
}

module original2() {
  translate([1448, 23, 93])
    import("./left_case_v3.stl");
  translate([1448, 23, 83])
    import("./left_case_v3.stl");
}

module half() {
  original();
}

module main() {
  difference() {
    union() {
      rotate(ang, [0,0,-1]) {
        half();
      }

      translate([346 + distance, 0, 0]) {
        mirror([1, 0, 0]) {
          rotate(ang, [0,0,-1]) {
            half();
          }
        }
      }
    }
    // holes left
    for (i = [1:15:45]) {
      translate([20.5,50.5 + i,-1.5]) {
        cube([4,7,6]);
      }
    }
    // holes right
    translate([302+distance,0,0]) {
      for (i = [1:15:60]) {
        translate([19.5,43 + i,-1.5]) {
          cube([4,7,6]);
        }
      }
    }
  }
}

module connector() {
  connector_h = 69;
  connector_w = distance+1;
  translate([161.4,13,0]) {
    cube([connector_w,connector_h,3]);
  }

  translate([183.6,13,0]) {
    cube([connector_w,connector_h,3]);
  }
}

module hinge(size = 4, part_w=15, part_no = 2, spacing = 15) {
  /* translate([183+23,13,-1]) { */
  for (i = [0:1:part_no-1]) {
    translate([0, (part_w * i) + (spacing * i), 0]) {
      rotate(90, [-1,0,0]) {
        /* translate([0,-1.0,-16]) cylinder(104,r=.1); */
        difference() {
          cylinder(h=part_w, r=size);
          translate([0,0,-1])
            cylinder(h=27, r=1);
        }
      }
    }
  }
  /* } */
}

module connector_hinge() {
  connector_h = 69;
  connector_w = (distance/2)+10.5;

  hinge_w = 11;
  hinge_space = 12.2;

  hinge_shift = ((hinge_space - hinge_w)  *1 )+ hinge_w;
  hinge_sth = (hinge_space - hinge_w) / 2;

  difference() {
    union() {
      translate([162.4,13,0]) {
        cube([connector_w,connector_h,3]);
      }
      translate([173 + (distance / 2),13,-1]) {
        hinge(part_w = hinge_w, part_no = 3, spacing = hinge_space, size = 4);
      }
    }
    translate([173 + (distance / 2),13,-1]) {
      translate([0,hinge_w,0]) {
        hinge(part_w = hinge_space, part_no = 3, spacing = hinge_w, size=4.5);
      }
    }
  }

  difference() {
    union() {
      translate([173.1 + (distance / 2),13,0]) {
        cube([connector_w,connector_h,3]);
      }
      translate([173 + (distance / 2),13,-1]) {
        translate([0,hinge_w + hinge_sth,0]) {
          hinge(part_w = hinge_w, part_no = 3, spacing = hinge_space, size = 4);
        }
      }
    }
    translate([173 + (distance / 2),13,-1]) {
      translate([0,-hinge_sth,0]) {
        hinge(part_w = hinge_space, part_no = 3, spacing = hinge_w, size = 4.5);
      }
    }
  }
}

/* translate([23.5,0,-30]) { */
/*   %cube([320,220,30]); */
/* } */

module bumps() {
  // bumps left
  for (i = [1:15:60]) {
    translate([21.5,44 + i,-3]) {
      cube([2,5,6]);
      translate([1,5,0]) {
        rotate(90, [1,0,0]) {
          cylinder(h=5, r=1, $fn=64);
        }
      }
    }
  }

  // bumps right
  translate([302+distance,0,0]) {
    for (i = [1:15:45]) {
      translate([20.5,51.5 + i,-3]) {
        cube([2,5,6]);
        translate([1,5,0]) {
          rotate(90, [1,0,0]) {
            cylinder(h=5, r=1, $fn=64);
          }
        }
      }
    }
  }
}

/* module llll() { */
/* } */

/* connector(); */
connector_hinge();
bumps();
main();
