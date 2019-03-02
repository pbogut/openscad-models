inner = 29;
outer = 35;

thickness = 2;
insert_h = 7;
insert_l = 30;

difference() {
    cube([outer+thickness*2, 5, insert_h]);
    translate([thickness, 0, thickness])
        cube([outer, 5, insert_h]);
}

translate([((outer-inner)/2)+thickness, 0, 0]) {
    hull() {
        cube([inner, 5, insert_h]);
        translate([0, insert_l, insert_h-(thickness/2)])
            cube([inner, 1, thickness/2]);
    }
}

translate([0, 0, -5]) { //3mm gap
    cube([thickness, 5, 10]);
    translate([outer+thickness, 0, 0])
        cube([thickness, 5, 10]);
    cube([outer+thickness*2, 5, thickness]);
}

translate([(outer/2)+thickness, 2.5, 15])
link_mount();


module link_mount() {

    ball_size = 7.5;
    connector_length = 15;
    tolerance = 0.20;
    thicknes = 0.8;
    do_cuts = false;

    outer_r = (ball_size + tolerance + thicknes);
    difference() {
        union() {
            translate([0, 0, -ball_size - connector_length])
                cylinder(h=ball_size, r=ball_size, r2=ball_size / 3, center=true);
            translate([0, 0, -ball_size*2 - connector_length])
                sphere(r=outer_r, center=true);
        }
        translate([0, 0, -ball_size*2  - connector_length]) {
            sphere(r=ball_size+tolerance, center=true);
        }
        translate([0, 0, -(outer_r*(2.65)) - connector_length])
            cube([2 * outer_r, 2 * outer_r, 10], center=true);
        if (do_cuts) {
            translate([0, 0, -ball_size -outer_r - connector_length]) {
                cube([thicknes, 2 * outer_r, 10], center=true);
                cube([2 * outer_r, thicknes, 10], center=true);
            }
        }
    }
}
