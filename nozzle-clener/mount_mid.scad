$fn = 32;

/* include <brush.scad> */

/* render_brush = false; */

tolerance = 0.5;

width = 18;
length = 43;
box_height = 15;
height = 2;
filet = 5;

box_thicknes=2;


outer_width = width+(box_thicknes*2);
outer_length = length+(box_thicknes*2);

gap_depth=5;
gap_size=1.5;

module box() {
    difference() {
        cube([outer_length, outer_width, box_height]);

        translate([box_thicknes, box_thicknes, box_height - gap_depth])
            cube([length, width, box_height]);

        translate([box_thicknes+gap_size, box_thicknes+gap_size, -1])
            cube([length-(gap_size*2), width-(gap_size*2), box_height]);
    }
}

module mount() {
    distance1 = 24;
    distance2 = 32;
    filet = 5;
    height = 2.4;

    difference() {
        translate([-distance1/2, 0, 0]) {
            hull() {
                translate([(-distance1/2)+0.5, -12, 0])
                    cube([outer_length, 1, height]);

                cylinder(h=height, r=filet);
                translate([distance1/2, distance2, 0])
                    cylinder(h=height, r=filet);
                translate([distance1, 0, 0])
                    cylinder(h=height, r=filet);
            }
        }
        translate([0, filet, 0])
        mount_holes();
    }
}
module mount_holes() {
    distance1 = 15;
    distance2 = 24;
    hole_r = 2;
    height = 5;

    skip_one_hole = true;

    translate([-distance1/2, 0, 0]) {
        cylinder(h=height, r=hole_r);
        translate([distance1/2, distance2, 0])
            cylinder(h=height, r=hole_r);
        translate([distance1, 0, 0])
            cylinder(h=height, r=hole_r);

        // filet
        cylinder(h=1, r=hole_r+1, r2=hole_r);
        translate([distance1/2, distance2, 0])
            cylinder(h=1, r=hole_r+1, r2=hole_r);
        translate([distance1, 0, 0])
            cylinder(h=1, r=hole_r+1, r2=hole_r);

        if (skip_one_hole) {
            cylinder(h=height, r=hole_r*2);
        }
    }
}

difference() {
    union() {
        mount();
        translate([-outer_length/2, -34, 0]) {
            box();
        }
    }
}
