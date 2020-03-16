$fn=64;

height = 10;
width = 72;

thicknes = 1.2;
bottom = 0.8;
top_addition = 5;

difference() {
    cylinder(h=height+bottom, r=(width/2) + thicknes, r2=(width/2) + thicknes + top_addition);
    translate([0, 0, thicknes])
    cylinder(h=height, r=(width/2), r2=(width/2) + top_addition);
}
