scale([1,1,1.333])
difference() {
  union() {
    import("./Paddle.stl");
    /* translate([26, 2, 0]) */
    /*   cube([48.6, 5, 5]); */


    //patch holes
    translate([26, 8.7, -0.354]) {
      cylinder(h=1.5, r=5, $fn=32);
      translate([48.6, 0, 0]) {
        cylinder(h=1.5, r=5, $fn=32);
      }
      translate([25.2, 9.5, 0]) {
        cylinder(h=1.5, r=4, $fn=32);
      }
      hull() {
        translate([66.6, 33.5, 0]) {
          cylinder(h=1.5, r=5, $fn=32);
          translate([1.0, -13, 0]) {
            cylinder(h=1.5, r=5, $fn=32);
          }
        }
      }
      hull() {
        translate([-17.8, 33.5, 0]) {
          cylinder(h=1.5, r=5, $fn=32);
          translate([-1.0, -13, 0]) {
            cylinder(h=1.5, r=5, $fn=32);
          }
        }
      }
    }
    translate([86.34, 32.65, -0.354]) {
      difference() {
        translate([3, -2, (0.750)]) {
          cube([4, 4, 1.5],center=true);
        }
        cylinder(h=1.5, r=2, $fn=32);
      }
    }
    translate([14.46, 32.76, -0.354]) {
      difference() {
        translate([-3, -2, (0.750)]) {
          cube([4, 4, 1.5],center=true);
        }
        cylinder(h=1.5, r=2, $fn=32);
      }
    }
  }



  //new holes

  translate([26, 8.7, -0.354]) {
    cylinder(h=5, r=1.5, $fn=32);
    translate([48.6, 0, 0]) {
      cylinder(h=5, r=1.5, $fn=32);
    }
  }
}
