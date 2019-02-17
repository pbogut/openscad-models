$fn=64;

// base
difference() {
    union() {
        cylinder(h=2, r=15);
        cylinder(h=2, r=16, r2=15);
    }
    // inner hole for rod
    translate([0, 0, 1]) {
        cylinder(h=2, r=6.2, r2=8.2);
    }
}

// hook
intersection() {
    cylinder(h=10, r=10);
    translate([-15, 1, 0]) {
        translate([0, 1, 3.1]) {
            rotate(90, [0, 1, 0]) {
                cylinder(h=30, r=7);
            }
        }
        cube([30, 15, 10]);
    }
    union() {
        difference() {
            translate([0, 6, 5]) {
                cube([20,20,10], center=true);
            }
            cylinder(h=10, r=6.2);
            translate([0, -5, 5]) {
                cube([12.4,10,10], center=true);
            }
        }
        translate([-7.7,-4,0]) {
            cylinder(h=10, r=1.5);
            translate([15.4,0,0]) {
                cylinder(h=10, r=1.5);
            }
        }
    }
}
