$fn = 64;

module mx_hole_cut() {
    cube([17.4, 17.4, 4]);
}

module mx_hole_fill() {
    translate([17.4/2,17.4/2,0]) {
        rotate(90, [0, 0, 1]) {
            union() {
                translate ([0, 7.95, 2]) {
                    cube ([17.4, 1.5, 4], center=true);
                }
                translate ([7.95, 0, 2]) {
                    cube ([1.5, 17.4, 4], center=true);
                }
                hull () {
                    translate ([7.95, 0, 2]) {
                        cube ([1.5, 2.75, 4], center=true);
                    }
                    translate ([7.2, 0, 1]) {
                        rotate (a=90.0, v=[1, 0, 0]) {
                            cylinder ($fn=30, h=2.75, r=1, center=true);
                        }
                    }
                }
                mirror ([0, 1, 0]) {
                    mirror ([1, 0, 0]) {
                        union () {
                            translate ([0, 7.95, 2]) {
                                cube ([17.4, 1.5, 4], center=true);
                            }
                            translate ([7.95, 0, 2]) {
                                cube ([1.5, 17.4, 4], center=true);
                            }
                            hull () {
                                translate ([7.95, 0, 2]) {
                                    cube ([1.5, 2.75, 4], center=true);
                                }
                                translate ([7.2, 0, 1]) {
                                    rotate (a=90.0, v=[1, 0, 0]) {
                                        cylinder ($fn=30, h=2.75, r=1, center=true);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

module pizero_mount(h=10, r=3, hole_r=1.2) {
    module pizero_mount_column() {
        difference() {
            cylinder(h=h, r=r);
            cylinder(h=h+1, r=hole_r);
        }
    }

    h_dist = 23.0;
    w_dist = 58.0;

    pizero_mount_column();
    translate([0, h_dist, 0]){
        pizero_mount_column();
    }
    translate([w_dist, 0, 0]) {
        pizero_mount_column();
    }
    translate([w_dist, h_dist, 0]) {
        pizero_mount_column();
    }
}

module sound_blaster_mount(thickness=1.2, length=10, h=10, hole_r=4, with_hole=true, hole_pos="top") {
    inner_w = 23.6;
    inner_space = 10;
    inner_l = 52;

    hole_shift = hole_pos == "top" ? 1 : (hole_pos == "bottom" ? -1 : 0);

    echo(hole_shift);

    translate([inner_l-length+(2*thickness), 0, 0]) {
        difference() {
            cube([length, inner_w + (2*thickness), h]);
            translate([-thickness,thickness,0]) {
                cube([length, inner_w, h+1]);
                translate([0, inner_w/2- inner_space/2, 0]) {
                    cube([length+thickness+1, inner_space, h+1]);
                }
            }
        }
    }

    difference() {
        cube([length, inner_w + (2*thickness), h]);
        translate([thickness,thickness,0]) {
            cube([length, inner_w, h+1]);
            if (with_hole) {
                translate([-thickness-1, inner_w/2, h/2 + hole_shift]) {
                    rotate(90, [0, 1, 0]) {
                        cylinder(h=thickness*3, r=hole_r);
                    }
                }
            }
        }
    }
}

module sensor_housing(thickness=1.2, with_hole=true) {
    /* cylinder(h=, r=5); */
    inner_h = 5;
    inner_w = 20;
    inner_l = 20;
    open_w = 10;
    sensor_r = 3;
    sensor_x = 4.6;
    sensor_y = 3.2;

    module sensor_housing_screw(with_hole = true) {
        // side cylinders
        cy_outer_r = 2;
        cy_inner_r = 1;
        translate([thickness+inner_w/2, thickness, 0])  {
            difference() {
                cylinder(h=inner_h+thickness, r=cy_outer_r);
                if (with_hole) {
                    cylinder(h=inner_h, r=cy_inner_r);
                }
            }
            translate([0, inner_l, 0]) {
                difference() {
                    cylinder(h=inner_h+thickness, r=cy_outer_r);
                    if (with_hole) {
                        cylinder(h=inner_h, r=cy_inner_r);
                    }
                }
            }
        }
    }

    difference() {
        cube([inner_w+(2*thickness), inner_l+(2*thickness), inner_h + thickness]);
        translate([thickness, thickness, 0]) {
            cube([inner_w, inner_l, inner_h]);
        }
        translate([3*thickness, inner_w/2 - open_w/2 + thickness, 0]) {
            cube([inner_l, open_w, inner_h]);
        }
        if (with_hole) {
            translate([sensor_r+thickness+sensor_y, sensor_r+thickness+sensor_x, 0]) {
                cylinder(h=inner_h+thickness+1, r=sensor_r);
            }
        }
        sensor_housing_screw(with_hole = false);
    }
    sensor_housing_screw();

}

module box(thickness=1.2) {
    inner_w = 75;
    inner_l = 90;
    inner_h = 25;
    t2 = thickness * 2;

    outer_w = inner_w+t2;
    outer_l = inner_l+t2;
    outer_h = inner_h+thickness;

    pi_h = 15;

    module box_sb(with_hole=true) {
        translate([60,0,0]) {
            rotate(90, [0, 0, 1]) {
                sound_blaster_mount(hole_r=4.5, with_hole=with_hole);
            }
        }
    }
    module box_lsh(with_hole=true) {
        translate([outer_w-5-thickness,thickness,((inner_h - 24) / 2)+thickness]) {
            rotate(90, [0, 0, 1]) {
                rotate(90, [1, 0, 0]) {
                    sensor_housing(with_hole=with_hole);
                }
            }
        }
    }

    module box_btn(cut=true) {
        translate([outer_w,70,4]) {
            rotate(90, [0, -1, 0]) {
                if (cut) {
                    mx_hole_cut();
                }

                translate([0, 0, 4]) {
                    mirror([0,0,1]) {
                        mx_hole_fill();
                    }
                }
            }
        }
    }

    difference() {
        cube([outer_w, outer_l, outer_h]);
        translate([thickness, thickness, thickness]) {
            cube([inner_w, inner_l, outer_h]);
        }
        box_sb(with_hole = false);
        box_lsh(with_hole = false);
        //sdcard
        translate([10,-1,pi_h]) {
            cube([14, 5, 5]);
        }
        // power
        translate([10, outer_l+1, outer_h/2]) {
            rotate(90, [1, 0, 0]) {
                scale([1, 0.66, 1]) {
                    cylinder(h=5, r=5);
                }
            }
        }

        //buttons
        box_btn();
        translate([0, -24, 0]) {
            box_btn();
        }
    }
    translate([30,5,0]) {
        rotate(90, [0, 0, 1]) {
            pizero_mount(h=15);
        }
    }


    box_sb();
    box_lsh();
    box_btn(cut=false);
    translate([0, -24, 0]) {
        box_btn(cut=false);
    }

    //btn support
    translate([outer_w-4, (outer_l/2)-0.3, 0]) {
        cube([2, (outer_l/2), 5]);
    }

}

box();
