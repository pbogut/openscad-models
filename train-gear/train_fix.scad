include <gears.scad>

// print in 25% of size

difference() {
  render() {
    bevel_gear(2, 18, 0.1, 8, pressure_angle = 30, helix_angle = 0);
  }

  translate([0, 0, -1]) {
    cylinder(h = 10, r = 6);
  }
}
