$fn = 30;
cylinder(15, r=7.5, r2=8.5);
translate([0, 0, 15]) {
  cylinder(1, r=12.5);
  translate([0, 0, 1])
    cylinder(3, r=12.5, r2=9.5);
}
