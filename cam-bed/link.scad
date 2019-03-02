$fn=32;

ball_size = 7.5;
connector_length = 15;
tolerance = 0.20;
thicknes = 0.8;
do_cuts = false;

module link_ball() {
    sphere(r=ball_size, center=true);
    translate([0, 0, -ball_size/2])
        cylinder(h=ball_size, r=ball_size / 3, r2=ball_size, center=true);
}

module link_connector() {
    translate([0, 0, -(ball_size + (connector_length / 2))])
        cylinder(h=connector_length, r=ball_size / 3, center=true);
}

module link_mount() {
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

module link() {
    link_ball();
    link_connector();
    link_mount();
}

difference() {
    link();
    translate([-25, -25, 6.5])
    #cube([50, 50, 5]);

}
