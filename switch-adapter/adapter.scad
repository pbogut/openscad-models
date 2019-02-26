$fn = 50;

support = "plane"; // ["plane", "with_hole", "none"]

switch_thick = 1.6;
adapter_thick = 0.8;

adapter_width = 8;
adapter_inner_height = 55;
adapter_inner_depth = 7.6;

adapter_height = adapter_inner_height + (2 * adapter_thick);
adapter_depth = adapter_inner_depth + (2 * adapter_thick);

support_height = 0.2;

cube([adapter_thick, adapter_height, adapter_width]);

translate([0, adapter_thick, 0])
rotate(90, [0, 0, -1])
cube([adapter_thick, adapter_depth, adapter_width]);

translate([0, adapter_height, 0])
rotate(90, [0, 0, -1])
cube([adapter_thick, adapter_depth, adapter_width]);


clamp_width=(adapter_thick * 2) + switch_thick;

translate([adapter_depth - adapter_thick, adapter_height-clamp_width, 0])
  cube([adapter_thick, clamp_width, adapter_width]);

translate([adapter_depth - adapter_thick, 0, 0])
  cube([adapter_thick, clamp_width, adapter_width]);

clamp_depth=adapter_thick + switch_thick;

translate([adapter_depth - clamp_depth - adapter_thick, adapter_height-clamp_width + adapter_thick, 0])
  rotate(90, [0, 0, -1])
    cube([adapter_thick, clamp_width, adapter_width]);

translate([adapter_depth - clamp_depth - adapter_thick, clamp_width , 0])
  rotate(90, [0, 0, -1])
    cube([adapter_thick, clamp_width, adapter_width]);


switch_top =  8;
switch_base =  16;
switch_length = 20;
switch_hole = 5;

something = 11;
space = 0.8;
v_space = 0.8;

module switch() {
  difference() {
    hull() {
      translate([-switch_length, 0, 0])
        cube([adapter_thick , switch_base ,adapter_width], center = true);
        cylinder(adapter_width, r=switch_top / 2, center = true);
    }
    cylinder(adapter_width + 2, r=switch_hole / 2, center = true);
    /* cylinder(adapter_width / 2, r=(switch_hole / 2) + 1 + (space / 2), center = true); */
    translate([0, 0, (adapter_width / 2) - (adapter_thick+v_space)])
      cylinder(adapter_thick*2, r=(switch_top / 2) + 2);
    translate([0, 0, -(adapter_width / 2)])
      cylinder(adapter_thick + v_space, r=(switch_top / 2) + 2);
  }
}

module mount() {
  cylinder(adapter_width, r=(switch_hole / 2) - space, center = true);
  /* #cylinder((adapter_width / 2) - space, r=(switch_hole / 2) + space, center = true); */

  translate([0, 0, (adapter_width / 2) - adapter_thick]) {
    hull() {
      cylinder(adapter_thick, r=switch_top / 2);
      translate([something, 0, 0])
        cube([6, 4, adapter_thick], center= true);
    }
  }
  translate([0, 0, -(adapter_width / 2)]) {
    hull() {
      cylinder(adapter_thick, r=switch_top / 2);
      translate([something, 0, adapter_thick])
        cube([6, 4, adapter_thick], center= true);
    }
  }

  translate([something,0,0])
    rotate(90, [0, 1, 0])
    difference() {
      cylinder(10 , r=4, center=true);
      translate([0,0,2])
        cylinder(10 , r=3, center=true);
    }
}

translate([-switch_length, (adapter_height / 2), (adapter_width / 2)])
rotate(180, [0,0,1]) {
  switch();
  mount();




  if (support == "plane" || support == "with_hole") {
    // support
    difference() {
      union() {
        translate([-(8/2)+0.4, -15/2, -(adapter_width / 2)+adapter_thick+v_space]) {
          cube([9,15, support_height]);
        }
        translate([-(8/2)+0.4, -15/2, (adapter_width/2) - adapter_thick-support_height]) {
          cube([9,15, support_height]);
        }
        translate([-(8/2)+0.4, -15/2, -(adapter_width / 2)]) {
          cube([9,1, adapter_width - adapter_thick]);
        }
        translate([-(8/2)+0.4, (15/2)-1, -(adapter_width / 2)]) {
          cube([9,1, adapter_width - adapter_thick]);
        }
      }
      if (support == "with_hole") {
        cylinder(adapter_width + 2, r=switch_hole / 2, center = true);
      }
    }
  }

}
