$fn=30;

module clip(o=20, t=10, w=20, l=30, s=10, b=t) {
  // lower corner
  difference() {
    translate([0, 0, t]) rotate(90, [0,1,0]) cylinder(w, r=t);
    translate([0-1, 0, t]) cube([w+2, l, s]);
  }

  // upper corner
  translate([0,0, o]) difference() {
    translate([0, 0, t]) rotate(90, [0,1,0]) cylinder(w, r=t);
    translate([0-1, 0, 0]) cube([w+2, l, s]);
  }

  cube([w, l, b]);

  translate([0, -t, t]) cube([w, t, o]);

  translate([0, 0, t+o]) cube([w, s, t]);
  translate([0, s, t+(t/2)+o]) rotate(90, [0,1,0]) cylinder(w, r=t/2);

  translate([0, l, b/2]) rotate(90, [0,1,0]) cylinder(w, r=b/2);
}

// right
translate([0, 0, 0])
clip(o=25, t=5, s=10, l=32, b=7);

// left
translate([30, 0, 0])
clip(o=25, t=5, s=10, l=30, b=10);
