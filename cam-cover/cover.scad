thickness = 1;
height = 16;
depth = 12;
inner_width = 10.5;
width = inner_width + (2 * thickness);

module camlock() {
  difference() {
    cube([depth, width, height]);
    translate([-thickness, thickness, -thickness])
      cube([depth + (2*thickness), inner_width, height]);
  }
}

camlock();
