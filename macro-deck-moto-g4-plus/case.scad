/* $fn = 100; */
inner_width = 7 + 150;
depth = 3 + 9;
inner_height = 20;
insert_depth = 40;
float_left = true;
rad = 5;
thickness = 1.6;
width = inner_width + (thickness * 2) - (2 * rad);
height = inner_height + (thickness * 2) - (2 * rad);
rant = 4;
over = 70;
/* bend_angle=5; */
bend_angle = 0;  // prints better

module baseblock(w = 55, h = 96, r = 5, t = 9) {
  hull() {
    cylinder(t, r = r);
    translate([w, 0, 0]) {
      translate([0, h, 0]) cylinder(t, r = r);
      cylinder(t, r = r);
      cylinder(t, r = r);
    }
    translate([0, h, 0]) cylinder(t, r = r);
  }
}

module phonecase() {
  rrant = rant;
  hrant = rant;
  difference() {
    baseblock(w = width, h = height, t = depth);
    translate([thickness, thickness, thickness])
        baseblock(w = width - (thickness * 2), h = height * 2, t = depth - (thickness * 2));
    translate([thickness + rrant, thickness + rrant, thickness])
        baseblock(w = width - ((thickness + rrant) * 2), h = height - (thickness * 2), t = depth);
    translate([width * 1.5, height + rad, rad + thickness]) rotate(-90, [0, 1, 0])
        cylinder(width * 2, r = rad);

    translate([thickness / 2, thickness + rrant, thickness]) {
      union() {
        translate([-(rad - (rant / 2)), height - (thickness * 2) - rad / 2, 0]) {
          difference() {
            translate([-(rad - (rant / 2)), 0, (height / 2) - thickness]) {
              cube([(rad - (rant / 2)) * 3, rad * 2, height / 2]);
            }
            cylinder(h = height, r = rad - (rant / 2), $fn = 32);
          }
          translate([width + (rad - thickness) + 0.8, 0, 0]) mirror([1, 0, 0]) {
            difference() {
              translate([-(rad - (rant / 2)), 0, (height / 2) - thickness]) {
                cube([(rad - (rant / 2)) * 3, rad * 2, height / 2]);
              }
              cylinder(h = height, r = rad - (rant / 2), $fn = 32);
            }
          }
        }
      }
    }
  }
}

translate([-width / 2, 0, 0]) {
  translate([0, 0, 0]) {
    rotate(90, [1, 0, 0]) {
      rotate(bend_angle, [-1, 0, 0]) phonecase();
    }
  }
}
