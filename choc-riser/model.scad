cut_inner_legs = 0.0;
cut_leg_length = 0.2;
cut_hole_y = 0.3;
cut_hole_x = 0.0;

render() difference() {
  import("./choc_tilted.stl");
  // holes
  translate([-1.5, 2.2 - cut_hole_x, 0]) {
    cube([3.1 + cut_hole_y, 1.3 + cut_hole_x, 10]);
  }
  translate([-1.5, -3.5, 0]) {
    cube([3.1 + cut_hole_y, 1.3 + cut_hole_x, 10]);
  }
  // legs
  translate([-2.2, -5, -5.7]) rotate(25, [0, 1, 0]) {
    translate([-0.2 - cut_leg_length, 0, 0.18]) {
      cube([3, 10, 5]);
    }
  }
  translate([-2.2, -5, -5.7]) rotate(25, [0, 1, 0]) {
    translate([-3.3, 2.8 - cut_inner_legs, 0.18]) {
      cube([3.5, 1, 5]);
    }
  }
  translate([-2.2, -5, -5.7]) rotate(25, [0, 1, 0]) {
    translate([-3.3, 6.2 + cut_inner_legs, 0.18]) {
      cube([3.5, 1, 5]);
    }
  }
}
