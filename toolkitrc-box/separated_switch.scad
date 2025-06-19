$fn = 64;

switch_d = 22.6;
switch_w = 30;

// box_w = 50;
box_w = 68;
box_d = 28;
box_h = 36;

connector_w = 16;
connector_d = 8;

thickness = 2;

cable_hole = 4;

switch_hole = 13;
switch_distance = 18.4;

switch_h = 28;
switch_w = 12;

render() difference() {
  cube([box_w + thickness * 2, box_d + thickness * 2, box_h + thickness]);
  translate([thickness, thickness, 0]) {
    cube([box_w, box_d, box_h]);
  }
  translate([0, box_d - cable_hole - thickness * 2, 0]) {
    cube([thickness, cable_hole * 2, cable_hole + thickness]);
  }
  translate([box_w + thickness, box_d - cable_hole - thickness * 2, 0]) {
    cube([thickness, cable_hole * 2, cable_hole + thickness]);
  }
  translate([switch_distance, (box_d + thickness * 2) / 2, 0]) {
    cylinder(h = 150, r = switch_hole / 2, center = true);
  }
  translate([0, 5, 13]) {
    translate([box_w + thickness, 0, 0]) {
      translate([0, -2, -6]) {
        % cube([thickness, switch_w, switch_h]);
      }
      cube([thickness, connector_d, connector_w]);
      translate([0, 4, -2.2]) {
        rotate(90, [0, 1, 0]) {
          cylinder(r = 1.5, h = 10);
        }
      }
      translate([0, 4, 18.2]) {
        rotate(90, [0, 1, 0]) {
          cylinder(r = 1.5, h = 10);
        }
      }
    }
  }
  translate([0, 19, 13]) {
    translate([box_w + thickness, 0, 0]) {
      translate([0, -2, -6]) {
        % cube([thickness, switch_w, switch_h]);
      }
      cube([thickness, connector_d, connector_w]);
      translate([0, 4, -2.2]) {
        rotate(90, [0, 1, 0]) {
          cylinder(r = 1.5, h = 10);
        }
      }
      translate([0, 4, 18.2]) {
        rotate(90, [0, 1, 0]) {
          cylinder(r = 1.5, h = 10);
        }
      }
    }
  }
}
