height = 25;

bar_width = 16.4;
bar_height = 4.8;

inner_r = 4.2;
outer_r = 5.9;

difference() {
  union() {
    translate([bar_width / -2, bar_height / -2, 0]) {
      cube([bar_width, bar_height, height]);
    }
    rotate(90, [0, 0, 1]) {
      scale([1, 1.2, 1]) {
        rotate(22.5, [0, 0, 1]) cylinder(h = height, r = outer_r, $fn = 8);
      }
    }
  }
  cylinder(h = height, r = inner_r, $fn = 32);
}
