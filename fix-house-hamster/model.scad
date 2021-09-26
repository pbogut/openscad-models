
w=28;
l=67;
overlap=5;
depth=3;

/* height= */

cube([l, w, depth]);

l2 = l+overlap;
w2 = w+overlap;

rh=15;

module roof() {
  hull() {
    translate([0, 0, 3+depth])
      rotate(90, [0, 1, 0])
      cylinder(h=l2, r=3);


    translate([0, -5+w2, 3+depth])
      rotate(90, [0, 1, 0])
      cylinder(h=l2, r=3);


    translate([0, -2.5+(w2/2), (3+depth + rh)])
      rotate(90, [0, 1, 0])
      cylinder(h=l2, r=1);
  }
}

module top_roof() {
  intersection() {
    translate([-50, -50, depth]) {
      translate([0, 0, 4]) {
        cube([200, 100, 50]);
      }
    }
    roof();
  }
}


module bot_roof() {
  intersection() {
    translate([-50, -50, depth]) {
        cube([200, 100, 2]);
    }
    roof();
  }
}


module squish_roof() {
  union() {
    bot_roof();
    translate([0, 0, -2])
      top_roof();
  }
}


$fn=32;
translate([-2.5, 0, 0]) {
  squish_roof();
  /* roof(); */
}

translate([-2.5, -2.5, 0])
#cube([0.4, w2, 5]);

translate([-2.9 + l2, -2.5, 0])
#cube([0.4, w2, 5]);
