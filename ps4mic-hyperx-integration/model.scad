main();

module main() {
    headset_mount();
    translate([0, 6.5+1.2, 0])
    ps4mic_mount();

translate([0, 1.2, 0])
    rotate(90, [1, 0, 0])
        ps4spk_mount();

    translate([0, 1.2 + (6.5/2) + (1.2/2), 0])
    rotate(180, [1, 0, 0])
        cable_hold();
}

module cable_hold() {
    l=15;
    h=4;
    w=5;
    thickness = 1.2;

    module round_cut() {
        rotate(90, [1, 0, 0])
        cylinder(h=thickness, r=(h/2)-(thickness/2), $fn=32);
    }

    difference() {
        union() {
            cube([l, thickness, h]);
            translate([0, (thickness/2)-(w/2), h-thickness])
            cube([l, w, thickness]);
        }
        translate([0, thickness, (h/2)-(thickness/2)])
            round_cut();
        translate([l, thickness, (h/2)-(thickness/2)])
            round_cut();
    }

}

module headset_mount() {
    thickness = 1.2;

    h=10.6;
    w=6.5;
    l=15;
    cut_w=4;

    difference() {
        cube([l, w+thickness+thickness, h+thickness+thickness]);
        translate([0, thickness, thickness])
            cube([l, w, h]);
        translate([0, thickness+(w/2)-(cut_w/2), h+thickness])
            cube([l, cut_w, thickness]);
    }
}

module ps4mic_mount() {
    thickness = 1.2;

    h=8;
    w=6;
    l=15;
    cut_w=4;

    difference() {
        cube([l, w+thickness+thickness, h+thickness+thickness]);
        translate([0, thickness, thickness])
            cube([l, w, h]);
        translate([0, thickness+(w/2)-(cut_w/2), h+thickness])
            cube([l, cut_w, thickness]);
    }
}

module ps4spk_mount() {
    thickness = 1.2;

    h=6;
    w=5;
    l=15;
    cut_w=3;
    cut_l=6;

    difference() {
        cube([l, w+thickness+thickness, h+thickness+thickness]);
        translate([0, thickness, thickness])
            cube([l, w, h]);
        translate([0, thickness+(w/2)-(cut_w/2), h+thickness])
            cube([cut_l, cut_w, thickness]);
        translate([cut_l, thickness, h+thickness])
            cube([l-cut_l, w, thickness]);
    }
}
