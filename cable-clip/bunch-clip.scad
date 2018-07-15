$fn=30;

gap = 3;

module elips(long=28, short=14, height=10) {
  scale_y = short / long;
  scale([1,scale_y,1])
    cylinder(height, r=long / 2);
}

module clip(long=28, short=0, height=10, thickness=2.4) {
  real_short = short == 0 ? (long / 2) : short;
  t2 = (thickness * 2);
  difference() {
    elips(long,real_short,height);
    elips(long-t2,real_short-t2,height);
    translate([-(long/2), 0, height / 2])
      cube([long, gap, height], center=true);
  }
  module ending() {
    hull() {
        cylinder(height, r=thickness/2);
        translate([-thickness, 0, 0])
          cylinder(height, r=thickness/2);
    }
  }

  translate([-(long/2)+thickness, -gap/2, 0])
    rotate(20, [0, 0, 1])
      ending();
  translate([-(long/2)+thickness, gap/2, 0])
    rotate(-20, [0, 0, 1])
      ending();
}

clip(long=28, short=14, height=10, thickness=2.4);
