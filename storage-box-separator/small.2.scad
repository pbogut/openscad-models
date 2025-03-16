height = 120;
width = 166;
depth = 40;
half_depth = depth / 2;
nozzle_diameter = 0.4;
base = 0.2;
triangle_height = 3;

translate([-nozzle_diameter, triangle_height, 0]) {
  cube([nozzle_diameter * 2, width - (2 * triangle_height), height]);
}
// translate([-depth / 2, 0, 0]) {
//   cube([depth, nozzle_diameter, height]);
// }
// translate([-depth / 2, width - nozzle_diameter, 0]) {
//   cube([depth, nozzle_diameter, height]);
// }

translate([-depth / 2, width - nozzle_diameter, 0]) {
  c = sqrt((half_depth * half_depth) + (triangle_height * triangle_height));
  a = asin(triangle_height / c);
  rotate(a, [0, 0, -1]) {
    cube([c, nozzle_diameter * 2, height]);
  }
  translate([half_depth, -triangle_height, 0]) {
    rotate(a, [0, 0, 1]) {
      cube([c, nozzle_diameter * 2, height]);
    }
  }
  translate([0, -width + nozzle_diameter, 0]) {
    rotate(a, [0, 0, 1]) {
      cube([c, nozzle_diameter * 2, height]);
    }
  }
  translate([half_depth, -width + nozzle_diameter + triangle_height, 0]) {
    rotate(a, [0, 0, -1]) {
      cube([c, nozzle_diameter * 2, height]);
    }
  }
}
