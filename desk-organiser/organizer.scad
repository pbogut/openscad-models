$fn = 50;
thickness = 0.6;
roundness = 5;
cover=5;


module box(size = [56, 15, 90], thickness = thickness, cover=cover, center = false) {
  x = size[0];
  y = size[1];
  z = size[2];
  t = thickness;
  dt = thickness * 2;

  difference() {
    cube([x, y, z]);
    translate([t, t, t])
      cube([x - dt, y - dt, z]);
  }
}
module open_box(size = [56, 15, 90], thickness = thickness, cover=cover, center = false, hole_start=cover) {
  x = size[0];
  y = size[1];
  z = size[2];
  t = thickness;
  dt = thickness * 2;
  ht = thickness / 2;
  cov = cover + roundness;
  hstart = hole_start + roundness;
  hcov = cov / 2;
  dcov = cov * 2;

  difference() {
    box([x, y, z])
    translate([t, t, t])
      cube([x - dt, y - dt, z]);

    rotate(90, [1, 0, 0])
      translate([cov, hstart, -t-ht])
        hull() {
          cylinder(dt, r=roundness);
          translate([x - dcov, 0, 0])
            cylinder(dt, r=roundness);
          translate([x - dcov, z, 0])
            cylinder(dt, r=roundness);
          translate([0,z,0])
            cylinder(dt, r=roundness);
        }
  }
}

module pen_holder(size = [56, 15, 90], hole = 10, space = 10, thickness = thickness, cover=cover, center = false) {
  x = size[0];
  y = size[1];
  z = size[2];
  t = thickness;
  dt = thickness * 2;
  rhole = hole / 2;

  hole_no = floor(x / (hole + space));
  margin = (x - (((hole + space) * hole_no) - space)) / 2;

  difference() {
    cube([x, y, z]);
    translate([t, t, t])
      cube([x - dt, y - dt, z-dt]);

    for (offset_ = [0 : space + hole : x - hole - space]) {
      translate([margin + rhole + offset_, y / 2, t])
        cylinder(z, r=rhole - t);
    }
  }

  difference() {
    union() {
      for (offset_ = [0 : space + hole : x - hole - space]) {
        translate([margin + rhole + offset_, y / 2, t])
          cylinder(z-t, r=rhole);
      }
    }
    for (offset_ = [0 : space + hole : x - hole - space]) {
      translate([margin + rhole + offset_, y / 2, t])
        cylinder(z, r=rhole - t);
    }
  }
}

module business_card_holder(size = [56, 15, 90], thickness = thickness, cover=cover, center = false, hole_start=cover) {
  x = size[0];
  y = size[1];
  z = size[2];
  open_box([x, y, z], hole_start=hole_start);
}

module paper_holder(size = [90, 90, 40], thickness = thickness, cover=cover, center = false) {
  x = size[0];
  y = size[1];
  z = size[2];
  open_box([x, y, z]);
}

module phone_holder(height = 15) {
  x = 75;
  y = 12.6;
  z = 30;
  t = thickness;
  dt = thickness * 2;
  ht = thickness / 2;
  cov = cover + roundness;
  hstart = cover + roundness;
  hcov = cov / 2;
  dcov = cov * 2;

  difference() {
    hull() {
      rotate(-20, [1, 0, 0])
      box([x, y, z]);
      translate([0, 0, - height])
        cube([75, 22, 5]);
    }
    rotate(-20, [1, 0, 0]) {
        translate([t, t, t])
          cube([x - dt, y - dt, z]);
        rotate(90, [1, 0, 0])
          translate([cov, hstart, -t-ht])
            hull() {
              cylinder(dt, r=roundness);
              translate([x - dcov, 0, 0])
                cylinder(dt, r=roundness);
              translate([x - dcov, z, 0])
                cylinder(dt, r=roundness);
              translate([0,z,0])
                cylinder(dt, r=roundness);
            }
    }
  }
}

module usbsdholder(size = [90, 35, 15], deep=10) {
  x = size[0];
  y = size[1];
  z = size[2];
  module block(size = size) {
    x = size[0];
    y = size[1];
    z = size[2];
    dr = roundness * 2;
    hull() {
        translate([0, y - roundness, z - roundness])
          rotate(90, [0,1,0])
            cylinder(x - roundness, r=roundness);
        translate([x - roundness, 0, z - roundness])
          rotate(90, [-1,0,0])
            cylinder(y - roundness, r=roundness);
        translate([x - roundness, y - roundness, z - roundness])
          sphere(roundness);
        cube([x, y, z - roundness]);
        translate([0, 0, roundness])
          cube([x/2, y/2, z-roundness]);
      }
  }
  module usb(size = [5, 12.5, 10]) {
    cube(size);
  }
  module sd(size = [2.5, 24.5, 10]) {
    x = size[0];
    y = size[1];
    z = size[2];
    cube(size);
    translate([x/2, 0, 0]) {
      cylinder(z, r=x);
      translate([0, y, 0])
        cylinder(z, r=x);
    }
  }
  module microsd(size = [1.1, 11.5, 10]) {
    x = size[0];
    y = size[1];
    z = size[2];
    cube(size);
    translate([x/2, 0, 0]) {
      cylinder(z, r=x);
      translate([0, y, 0])
        cylinder(z, r=x);
    }
  }

  layer = 0.2;

  difference() {
    block();
    translate([5, 11, (z - deep) + layer]) {
      usb();
      translate([1.2, -6, 0])
        sd();
      translate([8.2, 2, 0])
        rotate(90, [0,0,1])
          microsd();
    }
  }
}

/* !usbsdholder(); */

paper_holder([92, 92, 30]);
translate([0, 92 - thickness, 0])
  pen_holder([32+thickness, 15, 55], hole=11, space=2);

translate([32, 92 - thickness, 0])
  business_card_holder([60, 15, 45], hole=11, space=2, hole_start=30);

translate([92 - thickness, 0, 0])
  open_box([75, 50, 10], hole=11, space=2);

translate([92 - thickness, 0, 0])
  box([25, 50, 5], hole=11, space=2);

translate([92 - thickness, 50, 10])
  phone_holder(height=10);

translate([92 - thickness, 70-thickness, 0])
  box([75, 37, 10], hole=11, space=2);

translate([92 - thickness, 92-thickness, 0])
  open_box([75, 15, 45], hole=11, space=2, hole_start=25);

translate([0, 0, -2])
  cube([167 - thickness, 107 - thickness ,2]);
