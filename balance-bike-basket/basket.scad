/* $fn = 50; */
clip_r = 10;
width = 100;
height = 35;
depth = 50;
thickness = 0.8;
clip_thick = 2;
clip_w = 15;

module clip() {
  intersection() {
    difference() {
      cylinder(clip_w, r=clip_r + clip_thick);
      translate([0, 0, -thickness/2])
        cylinder(clip_w+thickness, r=clip_r);
    }
    translate([-clip_r*1.5, -clip_r/2, 0])
      cube([clip_r*3, clip_r*2, clip_w]);
  }
}

module basket() {
  module block(w, d, h) {
    hull() {
      for (x = [0, w]) {
        for (y = [0, d]) {
          for (z = [0, h]) {
            translate([x, y, z])
              sphere(thickness);
          }
        }
      }
    }
  }
  t2 = thickness * 2;
  difference() {
    block(width, depth, height);
    translate([thickness, thickness, thickness])
      block(width-t2, depth-t2, height);
  }
  translate([0,0,height]) {
    rotate(90, [0,1,0])
      cylinder(width, r=thickness);
    translate([0, depth, 0])
      rotate(90, [0,1,0])
        cylinder(width, r=thickness);
    rotate(90, [0,1,0])
    rotate(90, [-1,0,0])
      cylinder(depth, r=thickness);
    translate([width, 0, 0])
      rotate(90, [-1,0,0])
        cylinder(depth, r=thickness);
  }
}

basket();
translate([width/2, -clip_r-clip_thick, 0])
  clip();
translate([0,-clip_r-clip_thick,height-(clip_r/2)])
  rotate(90,[0,1,0])
    rotate(90, [0,0,1])
        clip();
translate([width-clip_w,-clip_r-clip_thick,height-(clip_r/2)])
  rotate(90,[0,1,0])
    rotate(90, [0,0,1])
      clip();
