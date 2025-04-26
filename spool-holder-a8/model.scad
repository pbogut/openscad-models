height = 80;
holder_r = 22;
rim_r = holder_r + 15;
edge_r = 4;

cylinder(h = height, r = holder_r);
cylinder(h = 5, r = rim_r);
translate([0, 0, 80]) {
  sphere(r = holder_r);
}

$fn = 32;
translate([0, 0, edge_r]) {
  for (i = [1:10:360]) {
    hull() {
      rotate(i, [0, 0, 1]) {
        translate([rim_r, 0, 0]) {
          sphere(r = edge_r);
        }
      }
      rotate(i + 10, [0, 0, 1]) {
        translate([rim_r, 0, 0]) {
          sphere(r = edge_r);
        }
      }
    }
  }
}

module mount() {
  difference() {
    import("fix_AnetA8BowdenMount.stl");
    translate([-17, -30, 5.1]) {
      cube([50, 50, 50]);
    }
  }
}

translate([45, -25, 0]) {
  mount();
}
