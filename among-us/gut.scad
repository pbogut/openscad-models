module gut() {
        translate([-130.2, -137.6, 0])
                import("gut.stl");
}
for (i = [0:1:3 ]) {
        translate([0, 0, i]) {
                gut();
        }
}
