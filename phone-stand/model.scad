rotate(90, [0, -1, 0])
import("./phonestand.stl");

$fn=64;

width=60;
length=60;
thickness=2;
round_size=7;


/* translate([-24, 4, 0]) { */
/*     bumper(); */
/*     translate([-12, 0, 0]) { */
/*         bumper(); */
/*         translate([-12, 0, 0]) */
/*             bumper(); */
/*     } */
/* } */

translate([-52, 2, 0]) {
    for(i=[0:1:6]) {
    translate([i*4, 0, 0])
        mini_bumper();
    }
}

module mini_bumper() {
    cylinder(h=width, r=1);
}

module bumper(h=5, t=2) {
    hull() {
        cylinder(h=width, r=1);
        translate([h, -h+t, 0])
            cylinder(h=width, r=1);
        translate([-h, -h+t, 0])
            cylinder(h=width, r=1);
    }
    /* bumper_part(); */
    /* rotate(90, [0, 0, 1]) */
    /*     bumper_part(); */
    /*     translate([-8, 0, 0]) */
    /* rotate(90, [0, 0, -1]) */
    /*     bumper_part(); */
}
module bumper_part(round_size=5) {
    /* translate([-round_size, round_size, 0]) */
    intersection() {
        cube([5, 5, width]);
        difference() {
            cylinder(h=width, r=round_size);
            cylinder(h=width, r=round_size-thickness);

        }

    }
}

module new_stand() {
    corner();
    translate([-length, 0, 0])
        mirror([1,0,0])
            corner();

    translate([-60+round_size-1, 0, 0])
        cube([60-(2*round_size)+2, thickness, width]);


    module corner() {
        intersection() {
            translate([(-round_size/2)+thickness, round_size/2, width/2])
                cube([(round_size*2)-4, (round_size*2)-1, width], center=true);

            translate([-round_size, round_size, 0])
                difference() {
                    cylinder(h=width, r=round_size);
                    cylinder(h=width, r=round_size-thickness);
                }
        }
    }
}
