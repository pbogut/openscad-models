
module bodyUp() {
        translate([-161.5, -177.5, 0])
                import("bodyUp.stl");
}

module bodyLow() {
        rotate(180, [1, 0, 0])
                translate([-165.35, -164.69, 0])
                import("bodyLow.stl");
}

module hole() {
        $fn=50;
        translate([0, 18.5, -3])
                cylinder(h=6, r=2.6);
}

translate([0, 0, -10]) {
        difference() {
                bodyLow();
                hole();
        }
}
