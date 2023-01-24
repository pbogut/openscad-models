thickness = 3;

module hollow_cylinder(h=5, r=5, t=1) {
  difference() {
    cylinder(h=h, r=r);
    translate([0, 0, -0.1]) {
      cylinder(h=h+0.2, r=r-t);
    }
  }
}

module hallon_mount(height=10) {
  $fn=64;
  difference() {
    cylinder(h=height, r=9);
    translate([0,0,3]) {
      hollow_cylinder(h=3, r=10, t=1.8);
    }
    translate([0, 0, -1]) {
      cylinder(h=height+2, r=4);
      /* translate([3, -1, 0]) { */
      /*   cube([6, 2, height+2]); */
      /* } */
      translate([-2.5, -7, 0]) {
        cube([5, 4, height+2]);
      }
      translate([-1, -9, 0]) {
        cube([2, 3, height+2]);
      }
    }
  }
  //support
  translate([4, -1, 0]) {
    cube([0.4, 5, height]);
  }
  translate([8.6, -1, 0]) {
    cube([0.4, 5, height]);
  }

  /* translate([-113.6, -110, 0]) */
  /* import("Sensor_Holder.stl"); */
}

module hallon_mount_full(base_height=10, height=40, shift=1) {
  difference() {
    union() {
      translate([0, -shift, 0])  {
        hallon_mount(height=base_height);
      }
      //left
      translate([4, 1-shift, 0]) {
        cube([5, 5, base_height]);
      }
      //right
      translate([-9, 1-shift, 0]) {
        cube([5, 5, base_height]);
      }
    }
    translate([8.2, -5, 3]) {
      cube([3, 10, 3]);
    }
    translate([-11.2, -1, 3]) {
      cube([3, 10, 3]);
    }
  }
  difference() {
    union() {
      hull() {
        //connector left
        translate([4, 5-shift, 0]) {
          cube([5, 1, base_height]);
        }
        //connector right
        translate([-9, 5-shift, 0]) {
          cube([5, 1, base_height]);
        }
        //connector vert
        translate([-8, 9, 0]) {
          cube([16, 2, base_height]);
        }
      }

      //vert
      translate([-8, 9, 0]) {
        difference() {
          cube([16, thickness, height]);
          // led lookthrough
          translate([8, 2, base_height+24]) {
            rotate(90, [1, 0, 0]) {
              cylinder(h=5, r=2, $fn=64);
            }
          }
        }
      }
    }

    translate([-11, 6, 3]) {
      rotate(-40, [0, 0, 1])
        cube([1.5, 10, 3]);
    }
    translate([10.5, 4.2, 3]) {
      rotate(40, [0, 0, 1])
        cube([1.5, 10, 3]);
    }
    translate([8.2, -1, 3]) {
      cube([3, 10, 3]);
    }
    translate([-11.2, -1, 3]) {
      cube([3, 10, 3]);
    }
  }
}

module bl_mount() {
  intersection() {
    import("BLTouch_mount_adjustable.stl", convexity=3);
    translate([-20, -15, 0]) {
      cube([25, 30, 20]);
    }
  }
}

module connector2() {
  intersection() {
    import("BLTouch_mount_adjustable.stl", convexity=3);
    translate([-17.4, 23, 0]) {
      cube([5, 20, 30]);
    }
  }
}

module connector() {
  h=25;
  module hole() {
    hull() {
      translate([0, 6, 9])
        rotate(90, [0,1,0])
        cylinder(h=5, r=1.5, $fn=32);
      translate([0, h-6, 9])
        rotate(90, [0,1,0])
        cylinder(h=5, r=1.5, $fn=32);
    }
  }

  difference() {
    cube([3, h, 28]);
    hole();
    translate([0, 0, 13])
      hole();
  }
}

module fan_mount() {
  $fn=64;
  difference() {
    union() {
      import("Anet__A8_Version.stl", convexity=3);
      translate([0, 0, thickness-2])  {
        import("Anet__A8_Version.stl", convexity=3);
      }
    }
    translate([-40,-7,-2]) {
      cube([15, 20, 30]);
    }

    translate([0.5, 0, -2])  {
      intersection() {
        hollow_cylinder(h=thickness+1, r=27, t=6);
        translate([-25, -35, 0])  {
          cube([44, 35, 5]);
        }
      }
    }
  }
  translate([11, -18, -1.5]) {
    hull() {
      cube([1, 1, thickness]);
      translate([8, -0.5, 0]) {
        cube([1, 1, thickness]);
      }
      translate([8, 10, 0]) {
        cube([1, 1, thickness]);
      }
    }
  }

  translate([2.5, 0, -1.5])  {
    difference() {
      hollow_cylinder(h=thickness, r=17, t=5);
      translate([0, -2.45, -1]) {
        cube([30,4.53,5]);
      }
    }
  }
}

length=17;
shift=2;
left=2;

translate([-28.5 - length, -15, 0]) {
  /* connector(); */
  difference() {
    union() {
      translate([13.5-left, 8.5, 0]) {
        cylinder(h=thickness, r=5, $fn=64);
      }
      hull() {
        translate([-left, 6, 0]) {
          cube([3, 12, thickness]);
        }
        translate([9 + length, 6, 0])
          cube([1, 27, thickness]);
      }
      translate([1.5, 6.5+shift, 0]) {
        cylinder(h=thickness, r=5, $fn=64);
      }
    }
    translate([-left, 0, 0]) {
      union() {
        translate([6, 14.6, 0]) {
          difference(){
            translate([-9, 0, 0]) {
              cube([6, 6, 5+thickness]);
            }
            cylinder(h=5, r=6, $fn = 64);
          };
        }
      }
      translate([8, 12+shift, 0]) {
        cylinder(h=5, r=2, $fn=64);
      }
      translate([0, 5+shift, -1]) {
        cube([1.5, 3, 5+thickness]);
      }
      translate([14.5, 5+shift, -1]) {
        cube([1.5, 3, 5+thickness]);
      }
    }
  }
}

translate([0,0,1.5]) {
  fan_mount();
}

translate([-37.5 - left, -38 + shift, -9])  {
  rotate(180, [0, 1, 0]) {
    rotate(90, [-1, 0, 0]) {
      hallon_mount_full(height=28);
    }
  }
}
