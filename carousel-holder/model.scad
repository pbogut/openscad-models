width = 66;
height = 70;


module front() {
    depth = 55;
    width = 70;
    difference() {
        intersection() {
            cube([width, depth, height]);
            translate([width/2, 0, 0]) {
                scale([3,1,1.1]) {
                    cylinder(h=height, r=15);
                }
            }
        }
        translate([width/2, 0, 0])
            scale([3,1.13,1.1])
            cylinder(h=height, r=10.8);
    }
}


module back() {
    depth = 55;
    width = 70;
    difference() {
        intersection() {
            cube([width, depth, height]);
            translate([width/2, 0, 0]) {
                scale([3,0.5,1.1]) {
                    cylinder(h=height, r=16);
                }
            }
        }
        translate([width/2, 0, 0])
        scale([3,0.5,1.1])
        cylinder(h=height, r=10.8);
    }
    translate([5, 3, 0])
        cube([width-10, 3, height]);
}

module mount() {
    width = 24;
    depth = 14;
    height = 36;
    gap = 6;


    rrr = 10;

    r = 3;


    module mount_base() {
        intersection() {
            translate([14.5, 1, 0])
                scale([1,0.5,1])
                    cylinder(h=1, r=14);
            cube([100, 100, 100]);
        }
    }
    module mount_top() {
        r=3;
        l=15;
        d=30;
        hull() {
            translate([r, r, 0])
                sphere(h=1, r=r);
            translate([(l*2) - r, r, 0])
                sphere(h=1, r=r);
            translate([0, d, 0])  {
                translate([r, r, 0])
                    sphere(h=1, r=r);
                translate([(l*2) - r, r, 0])
                    sphere(h=1, r=r);
            }
        }
    }
    module mount_insert(w, d, h, r=3) {
        module flat() {
            translate([r, r, r])
                sphere(h=1, r=r);
            translate([width-r, depth-r, r])
                sphere(h=1, r=r);
            translate([width-r, r, r])
                sphere(h=1, r=r);
            translate([r, depth-r, r])
                sphere(h=1, r=r);
        }
        hull() {
            flat();
            echo(h);
            translate([0, 0, h])
                flat();
        }
    }

    /* #cube([width, depth, height]); */
    hull() {
        mount_base();
        translate([0, 0, 70]) {
            mount_top();
        }
    }
    translate([r, 19, 70]) {
        mount_insert(width, depth, height, r);
    }


}

difference() {
    union() {
        translate([20, 11, 0])
            mount();

                front();
        translate([0, -10, ]) {
            mirror([0, 1, 0]) {
                /* back(); */
            }
        }
    }
    hole_w = 2;
    hole_h = 4;
    translate([0, 0, 5]) {
        translate([-40, -35, 0])
            rotate(-45, [0, 0, 1])
                cube([hole_w, 75, hole_h]);
        translate([107, -35, 0])
            rotate(45, [0, 0, 1])
                cube([hole_w, 75, hole_h]);
        translate([-10, 15, 0])
                cube([75, hole_w, hole_h]);
    }
    translate([0, 0, 23]) {
        translate([-40, -35, 0])
            rotate(-45, [0, 0, 1])
                cube([hole_w, 75, hole_h]);
        translate([107, -35, 0])
            rotate(45, [0, 0, 1])
                cube([hole_w, 75, hole_h]);
        translate([-10, 21, 0])
                cube([75, hole_w, hole_h]);
    }
    translate([0, 0, 42]) {
        translate([-40, -35, 0])
            rotate(-45, [0, 0, 1])
                cube([hole_w, 75, hole_h]);
        translate([107, -35, 0])
            rotate(45, [0, 0, 1])
                cube([hole_w, 75, hole_h]);
        translate([-10, 29, 0])
                cube([75, hole_w, hole_h]);
    }
    translate([0, 0, 60]) {
        translate([-40, -35, 0])
            rotate(-45, [0, 0, 1])
                cube([hole_w, 75, hole_h]);
        translate([107, -35, 0])
            rotate(45, [0, 0, 1])
                cube([hole_w, 75, hole_h]);
        translate([-10, 37, 0])
                cube([75, hole_w, hole_h]);
    }

}
