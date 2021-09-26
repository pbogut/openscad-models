$fn = 32;

seat_r = 25/2;
stick_r = 20/2;

height = 60;

angle = 14.2;


thickness = 5;

left();
translate([2, 0, 0])
right();

module left() {
    difference() {
        full();
        translate([0, -20, 0])
            cube([100, 100, 100]);
    }
}

module right() {
    difference() {
        full();
        translate([-100, -20, 0])
            cube([100, 100, 100]);
    }
}

module full() {
    difference() {
        block();
        pipes();
        screws();
    }
}

module screws() {
    module hole() {
        rotate(90, [0, 1, 0]) {
            cylinder(h=100, r=2.25);
        }
    }
    translate([-50, 25, 10]) {
        hole();
    }
    translate([-50, 25, 30]) {
        hole();
    }
    translate([-50, 25, 50]) {
        hole();
    }
}



module block() {
    hull() {
        cylinder(h=height, r=seat_r+thickness);
        translate([-2.5, seat_r, 0])
            %cube([5, 18, 5]);
        translate([-2.5, seat_r, 60-5])
            %cube([5, 32, 5]);

        difference() {
            translate([0, 32, -30])
                rotate(14.2, [-1, 0, 0])
                    cylinder(h=120, r=stick_r+thickness);

            translate([-100, -100, -100])
                cube([200, 200, 100]);
            translate([-100, -100, 60])
                cube([200, 200, 100]);
        }
    }
}

module pipes() {
    cylinder(h=height, r=seat_r);
    translate([-2.5, seat_r, 0])
        %cube([5, 18, 5]);
    translate([-2.5, seat_r, 60-5])
        %cube([5, 32, 5]);

    translate([0, 32, -30])
        rotate(14.2, [-1, 0, 0])
        cylinder(h=120, r=stick_r);
}
