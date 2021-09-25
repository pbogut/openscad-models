$fn=64;

piston_h = 10;
piston_r = 4;
screw_or = 3;
screw_ir = 1.75;
screw_thread_clearence = 4;

piston_top = 2;

cover_t = 2;
cover_r = 6; //piston_r + cover_t;
cover_h = 14;
cover_gap = 2;

handle_h = 5;

piston_end_clearance=0.05;
cover_clearance=0.3;

module piston_end() {
  difference() {
    union() {
      translate([0, 0, -(piston_r/3)]) {
        sphere(piston_r);
        cylinder(h=piston_r/2, r=piston_r);
      }
    }
    difference() {
      cylinder(h=piston_h, r=piston_r);
      cylinder(h=piston_h, r=screw_or - piston_end_clearance);
    }
    translate([-piston_r, -piston_r, -piston_r*3])
    cube([piston_r*2, piston_r*2, piston_r*2]);
  }
}

module piston() {
  difference() {
    cylinder(h=piston_h, r=piston_r);
    cylinder(h=piston_h, r=screw_thread_clearence/2);
    cylinder(h=piston_h-piston_top, r=screw_or);
  }
}

module cover() {
  difference() {
    union() {
      cylinder(h=cover_h, r=cover_r);
      cylinder(h=cover_t, r1=cover_r, r2=cover_r + cover_gap);
    }
    translate([0, 0, cover_t])
    cylinder(h=cover_h - cover_t, r=piston_r + cover_clearance);
    cylinder(h=cover_h, r=screw_thread_clearence/2);
  }
}

module handle() {
  difference() {
    cylinder(h=handle_h, r1=5, r2=7);
    cylinder(h=handle_h, r=screw_ir);
    translate([0, 0, 1.2]) {
    cylinder(h=handle_h-1.2, r=3.75, $fn=6);
    }
  }
}



rotate(180, [1, 0, 0])
translate([0, 0, -piston_h])
piston();
translate([piston_r*3, 0, piston_r])
piston_end();
translate([piston_r*3 + cover_r*3, 0, 0])
cover();
translate([-piston_r*4, 0, 0])
handle();
