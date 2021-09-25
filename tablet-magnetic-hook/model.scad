$fn=64;

full_cut=1;
width=60;
hook_size=10;



length=45;
shift_1=-40;
corner_w=50;
cube_s1=35;
cube_s2=20;
shift_2=-15;

length=55;
shift_1=-50;
corner_w=60;
cube_s1=42;
cube_s2=30;
shift_2=-22;


module corner(w=40) {
  difference() {
  cube([width, w, w]);
  rotate(90, [0, 1, 0])
  cylinder(h=width, r=w);

  }
}


module hook() {
  rotate(90, [0, 1, 0]) {
    difference() {
      cylinder(h=width, r=hook_size);
      cylinder(h=width, r=5);
      translate([-5, 0, 0])
        cube([hook_size, 20, width]);
      cube([hook_size, 20, width]);
    }
    translate([7.5, 0, 0])
      cylinder(h=width, r=2.5);
  }
}


hook();


intersection() {
  translate([0, -6, shift_1]) {
    corner(w=corner_w);
  }
  translate([0, 10, shift_2]) {
    cube([width, cube_s1, cube_s2]);
  }
}


translate([0, 0, 5])
cube([width, length, 5]);


back_thickness=8;

difference() {
  hull() {
    translate([0, length, hook_size-back_thickness/2]) {
      rotate(90, [0, 1, 0]) {
        cylinder(h=width, r=back_thickness/2);
      }
      translate([0, -10, -60]) {
        rotate(90, [0, 1, 0]) {
          cylinder(h=width, r=back_thickness/2);
        }
      }
    }
  }


  #translate([(width/2)-10.5, -shift_1, -35]) {
    rotate(80, [1, 0, 0]) {
      translate([0, -11, 0])
        if (full_cut == 1) {
          cube([43, 22, 4]);
        } else {
          cube([33, 22, 4]);
        }
      cylinder(h=4, r=11);
      translate([21, 0, 0])
        cylinder(h=4, r=11);
    }
  }
}
