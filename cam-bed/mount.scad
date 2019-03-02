$fn = 32;

wall_height=2;
wall_thickness=2;
bottom_height=2;

hole_to_wall_x=2;
hole_to_wall_y=2.5;
hole_r=2;

size=35;

module mount() {
    difference() {
        union() {
            intersection() {
                cube([size, size, 7]);
                cylinder(h=bottom_height, r=size);
            }
            translate([0, 0, bottom_height]) {
                cube([wall_thickness, size-wall_height, wall_height]);
                cube([size-wall_height, wall_thickness, wall_height]);
                intersection() {
                    cube([size, wall_thickness, wall_height]);
                    translate([size-wall_height, wall_thickness, 0])
                        rotate(90, [1, 0, 0])
                            cylinder(h=wall_thickness, r=wall_height);
                }
                intersection() {
                    cube([wall_thickness, size, wall_height]);
                    translate([0, size-wall_height, 0])
                        rotate(90, [0, 1, 0])
                            cylinder(h=wall_thickness, r=wall_height);
                }
            }
        }
        wall_distance_x = wall_thickness + hole_r + hole_to_wall_x;
        wall_distance_y = wall_thickness + hole_r + hole_to_wall_y;
        translate([wall_distance_x, wall_distance_y, 0])
            cylinder(h=bottom_height+1, r=hole_r);
    }
}

module x_mount() {
    wall_height=4;
    size=25;
    hole_r=1.8;
    difference() {
        union() {
            difference() {
                cube([size, size, bottom_height]);
                translate([size*1.2, size*1.3, 0])
                    cylinder(h=bottom_height, r=size);
            }
            translate([0, 0, bottom_height]) {
                cube([wall_thickness, size-wall_height, wall_height]);
                cube([size-wall_height, wall_thickness, wall_height]);
                intersection() {
                    cube([size, wall_thickness, wall_height]);
                    translate([size-wall_height, wall_thickness, 0])
                        rotate(90, [1, 0, 0])
                            cylinder(h=wall_thickness, r=wall_height);
                }
                intersection() {
                    cube([wall_thickness, size, wall_height]);
                    translate([0, size-wall_height, 0])
                        rotate(90, [0, 1, 0])
                            cylinder(h=wall_thickness, r=wall_height);
                }
            }
        }
        wall_distance_x = 8 + wall_thickness;
        wall_distance_y = 8 + wall_thickness;
        #translate([wall_distance_x, wall_distance_y, 0])
            cylinder(h=bottom_height+1, r=hole_r);
    }
}

module x_with_ball() {
    x_mount();
    ball_size = 7.5;
    translate([ball_size, -ball_size, -ball_size/2]) {
        rotate(145, [1,0,0]) {
            sphere(r=ball_size, center=true);
            translate([0, 0, -ball_size/2])
                cylinder(h=ball_size, r=ball_size / 3, r2=ball_size, center=true);
        }
    }
    hull() {
        translate([ball_size, -ball_size, -ball_size/2]) {
            rotate(145, [1,0,0])
                translate([0, 0, -ball_size/2])
                    cylinder(h=ball_size, r=ball_size / 3, center=true);
        }
        translate([ball_size-(bottom_height+wall_height)/2, 0, 0])
            cube([bottom_height+wall_height,wall_thickness,bottom_height+wall_height]);
    }
}

module bed_with_ball() {
    mount();
    ball_size = 7.5;
    translate([ball_size, -ball_size, ball_size]) {
        rotate(55, [1,0,0]) {
            sphere(r=ball_size, center=true);
            translate([0, 0, -ball_size/2])
                cylinder(h=ball_size, r=ball_size / 3, r2=ball_size, center=true);
        }
    }
    hull() {
        translate([ball_size, -ball_size, ball_size]) {
            rotate(55, [1,0,0])
                translate([0, 0, -ball_size/2])
                    cylinder(h=ball_size, r=ball_size / 3, center=true);
        }
        translate([ball_size-(bottom_height+wall_height)/2, 0, 0])
            cube([bottom_height+wall_height,wall_thickness,bottom_height+wall_height]);
    }
}

/* bed_with_ball(); */
x_with_ball();
