include <ISOThread.scad>
// constants, do not change
WrenchSizes=1;
nut_hight=5.1;

nut_size=8;
nut_tolerance=0;
//add some tolerance if you cant fit nut on feeder
nut_tolerance=0.05;

// configurables
feeder_height=20;
cap_height=feeder_height - 5;
filet_height=2;
tfpu_r=2.25;

module nut() {
    difference() {
        hex_nut(8,10);
        cylinder(h=1, r=(nut_size/2)+1, r2=nut_size/2);
    }
}

module cap() {
    difference() {
        hex_nut(8,10);
        cylinder(h=1, r=(nut_size/2)+1, r2=nut_size/2);
    }
    translate([0,0,2]) {
        difference() {
            union() {
                cylinder(h=cap_height-2, r=6, $fn=16);
                translate([0,0,cap_height-2]) {
                    sphere(h=cap_height-2, r=6.1, $fn=16);
                }
            }
            union() {
                cylinder(h=cap_height-2, r=4.6);
                translate([0,0,cap_height-2]) {
                    sphere(h=cap_height-2, r=4.6);
                }
            }
        }
    }
}

module feeder() {
    difference() {
        hex_bolt(8,feeder_height - nut_hight);
        cylinder(h=feeder_height, r=tfpu_r);
        cylinder(h=filet_height, r=tfpu_r+1, r2=tfpu_r);
        translate([0,0,feeder_height-filet_height])
            cylinder(h=filet_height, r2=tfpu_r+1, r=tfpu_r);
    }
}


// render
feeder();
translate([20, 0, 0]) {
    scale([1+nut_tolerance,1+nut_tolerance,1]) {
        nut();
    }
}
translate([40, 0, 0]) {
    scale([1+nut_tolerance,1+nut_tolerance,1]) {
        cap();
    }
}
