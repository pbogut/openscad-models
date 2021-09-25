$fn=32;
cover_r=18.5;
hole_r=2.68;
hole_offset=10;
thickness = 2;

hold_h=15;

hull() {
    cylinder(r=4.5);
    translate([0, 0, hold_h/2]) {
        cylinder(r=2.25);
    }
}
hull() {
    translate([0, 0, hold_h/2]) {
        cylinder(r=2.25);
        translate([0, 0, hold_h/2]) {
            sphere(4);
        }
    }
}




difference() {
    union() {
    cylinder(h=thickness, r=cover_r);
        translate([hole_offset, 0, 0]) {
            cylinder(h=7, r=hole_r+1);
        }
    }
    translate([hole_offset, 0, 0]) {
        cylinder(h=thickness, r=hole_r);
        cylinder(h=7, r=hole_r);
    }
}
