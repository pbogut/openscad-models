module original() {
  translate([96, 90, 0]) {
    import("./kailh_choc_low_profile_keycap.stl");
  }
}

module legs() {
  intersection() {
    original();
    translate([3.5,3.5,-0.2]) {
      cube([10,10,5]);
    }
  }
}

module cap_bot_pixel() {
  difference() {
    original();
    translate([3.5,3.5,-0.2]) {
      cube([10,10,5]);
    }
    translate([-1.5,-1.5,4.31]) {
      cube([20,20,5]);
    }
  }
}
module cap_bot() {
  for (i = [0:.01:1]) {
    translate([0, 0, i]) cap_bot_pixel();
  }
}
module cap() {
  translate([-0.83, -0.83, 0]) {
    scale([1.1, 1.1, 1]) {
      difference() {
        original();
        translate([3.5,3.5,-0.2]) {
          cube([10,10,5]);
        }
      }
    }
  }
  /* translate([0, 0, -1]) */
        /* cap_bot(); */
}

/* scale([1, 1.25, 1]) */
scale([1.2, 1, 1]) {
  cap();
}
translate([1.72, 0, 0]) {
  legs();
}
