inner_width = 73;
inner_height = 139;
rad = 5;
thickness = 0.8;
depth = 11;
width = inner_width + (thickness * 2) - (2 * rad);
height = inner_height + (thickness * 2) - (2 * rad);
buttons_hole = 42;
buttons_hole_w = 6;
rant = 7;
over = 70;
buttons_h = 74;

module baseblock(w=55, h=96, r=5, t=9) {
  hull() {
    cylinder(t, r=r);
    translate([w, 0, 0]) {
      translate([0, h, 0]) cylinder(t, r=r);
      cylinder(t, r=r);
      cylinder(t, r=r);
    }
    translate([0, h, 0]) cylinder(t, r=r);
  }
}



module phonecase() {
  rrant = rant * 2;
  hrant = rant;
  difference() {
    baseblock(w=width, h=height, t=depth);
    hull() {
      translate([thickness, thickness, thickness])
        baseblock(w=width - (thickness * 2), h=height - thickness, t=depth - (thickness * 2));
      translate([thickness + rrant, thickness + rrant, thickness])
        baseblock(w=width - ((thickness + rrant) * 2), h=height - (thickness * 2), t=depth);
    }
    translate([thickness + hrant, thickness + rrant + over, -thickness])
        baseblock(w=width - ((thickness + hrant) * 2), h=height - (thickness * 2), t=depth);
    /* #translate([thickness + rant, thickness + rant + over, -1]) */
    /*   baseblock(w=width - ((thickness + rant) * 2), h=height, t=9); */
    translate([width + rad - (thickness * 1.5), buttons_h, (depth - buttons_hole_w) / 2])
      cube([thickness*2, buttons_hole, buttons_hole_w]);
  }

}

bike_pipe_r = 15;
bike_mount_r = 20;

module bikemount(rad = -100) {
    rotate(rad, [1, 0, 0])
      intersection() {
        translate([-bike_mount_r, -bike_mount_r - (bike_mount_r / 2), -thickness / 2])
          cube([bike_mount_r * 2, bike_mount_r * 2, 50 + thickness]);

        difference() {
          cylinder(50, r=bike_mount_r);
          translate([0, bike_pipe_r / 2, -thickness])
            cylinder(50 + (thickness * 2), r=bike_pipe_r);
        }

      }
}

!phonecase();
translate([0, -2*rad, 0])
  intersection() {
    translate([width / 2, 0, -8])
      bikemount();
    translate([0, 0, - 2 * bike_mount_r])
        cube([width, over, bike_mount_r * 2]);
  }
