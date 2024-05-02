$fn = 128;
module clip(r = 10, width = 30, thickness = 2, gap = 5, extend_base = 0) {
  outer_r = r + thickness;
  mod_width = (width - (2 * gap)) / 3;

  translate([0, 0, -outer_r]) cube([outer_r * 2 + extend_base, width, thickness]);

  translate([outer_r, width, 0]) {
    difference() {
      rotate(90, [1, 0, 0]) {
        cylinder(h = width, r = outer_r);
        translate([-outer_r, -outer_r, 0]) {
          cube([outer_r * 2, outer_r, width]);
        }
      }
      rotate(90, [1, 0, 0]) {
        cylinder(h = width, r = r);
      }
      translate([0, -mod_width - gap, -0.5 * outer_r]) {
        cube([outer_r, mod_width + gap, 1.5 * outer_r]);
      }
      translate([0, -width, -0.5 * outer_r]) {
        cube([outer_r, mod_width + gap, 1.5 * outer_r]);
      }
      translate([-outer_r, ((-mod_width - gap) * 2), -0.5 * outer_r]) {
        cube([outer_r, mod_width + gap + gap, 1.5 * outer_r]);
      }
    }
  }
}
clip(r = 3, extend_base = 3);
