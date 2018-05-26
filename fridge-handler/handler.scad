$fn = 60;

tickness = 2;
width = 30;
length = 55;
height = 25;

side_support = 5;
hook_height = 12;

hole_size = 2;
hole_x_offset = 2;
hole_z_offset = 3;


module fillet(r=5, t=2) {
  difference() {
    cube([r, t, r]);
    translate ([0,t + (t/2),0])
      rotate(90, [1,0,0])
        cylinder(t*2, r=r);
  }
}

module base() {
  cube([width,length,tickness]);
}

module side() {

  hook1pos = 20;
  hook2pos = 40;

  module support() {
    translate([tickness, 0, tickness])
    difference() {
      cube([side_support, tickness, height-tickness]);
      translate([0.5, -(tickness / 2), (height - tickness) - 4.5])
      fillet(t = tickness * 2, r=5);
    }
  }

  module hook(open = false) {
    translate([tickness, 0, tickness]) {
      difference() {
        cube([(hole_size*2) + tickness * 2, tickness, hook_height-tickness]);
        translate([hole_size+hole_x_offset, 0, hole_size+hole_z_offset])
        rotate(90, [1, 0, 0])
          translate([0 ,0, -tickness - (tickness / 2)])
            cylinder(tickness*2, r=hole_size);
          translate([4, -tickness + (tickness / 2), 5])
            fillet(t = tickness * 2, r=5);

        if (open) {
          translate([hole_x_offset, -tickness + (tickness / 2), 0])
            cube([hole_size*2, tickness * 2, hole_size*2]);
          translate([hole_x_offset + hole_size+tickness - (tickness / 2), -tickness + (tickness / 2), 0])
            cube([hole_size*2, tickness * 2, hole_size * 2]);

        }
      }
    }
  }

  cube([tickness, length, height]);
  support();
  translate([0, length-tickness, 0])
    support();

  translate([0, hook1pos, 0])
  hook(open = true);

  translate([0, hook2pos, 0])
  hook();
}

base();
side();
/* fillet(); */
