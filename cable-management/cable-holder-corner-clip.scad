// translate([20, 0, 0]) import("./cable_management_clip.stl");

$fn = 64;

additional_thingy = true;

inner_curve = 7;
thickness = 2;
screw_thickness = 5;
height = 25;
bot_height = 4;
depth = 10;
real_length = 50;
length = real_length - (2 * inner_curve);
clip_r = 1.5;

module corner(type = 0, r = 5) {
  angle = 90 * -type;
  rotate([0, 0, angle]) {
    intersection() {
      difference() {
        cylinder(h = height, r = r + thickness);
        cylinder(h = height, r = r);
      }
      cube(height, 7, 7);
    }
  }
}

module screw_base(size_x = 20, size_y = 10) {
  difference() {
    intersection() {
      union() {
        translate([0, size_y / 2, 0]) {
          cube([size_y, size_x - size_y, bot_height]);
        }
        translate([-size_y / 2, 0, 0]) {
          cube([size_y, size_x, bot_height]);
        }
        translate([size_y / 2, size_y / 2, 0]) {
          cylinder(h = bot_height, r = size_y / 2);
        }
        translate([size_y / 2, size_y * 1.5, 0]) {
          cylinder(h = bot_height, r = size_y / 2);
        }
      }
      cube([size_y, size_x, bot_height]);
    }

    translate([4, size_x / 2, 0]) {
      cylinder(h = 2, r2 = 1.5, r1 = 3, center = false);
      cylinder(h = bot_height + thickness + thickness, r = 1.5, center = false);
    }
  }

  translate([-thickness, 0, 0]) {
    cube([thickness, size_x, bot_height]);
  }
}

module screw_base_clip(size_x = 20, size_y = 10) {
  module xxx(rrr = 3.6) {
    translate([4, size_x / 2, 0]) {
      hull() {
        cylinder(h = bot_height, r = rrr);
        translate([size_y / 2 - 4, -rrr, -thickness]) {
          cube([5, rrr * 2, bot_height + thickness]);
        }
      }
      translate([0, 0, -thickness]) cylinder(h = thickness, r2 = rrr, r1 = rrr + 0.6);
    }
  }

  difference() {
    intersection() {
      union() {
        translate([0, size_y / 2, 0]) {
          cube([size_y, size_x - size_y, bot_height]);
        }
        translate([-size_y / 2, 0, 0]) {
          cube([size_y, size_x, bot_height]);
        }
        translate([size_y / 2, size_y / 2, 0]) {
          cylinder(h = bot_height, r = size_y / 2);
        }
        translate([size_y / 2, size_y * 1.5, 0]) {
          cylinder(h = bot_height, r = size_y / 2);
        }
      }
      cube([size_y, size_x, bot_height]);
    }

    xxx(rrr = 4);
  }
  difference() {
    xxx(rrr = 3.6);
    translate([4, size_x / 2, -thickness]) {
      cylinder(h = 2, r2 = 1.5, r1 = 3, center = false);
      cylinder(h = bot_height + thickness + thickness, r = 1.5, center = false);
    }
  }

  translate([-thickness, 0, 0]) {
    cube([thickness, size_x, bot_height]);
  }
}

corner(3, r = inner_curve);
translate([0, inner_curve, 0]) {
  cube([length, thickness, height]);
}
translate([length, 0, 0]) {
  corner(0, r = inner_curve);
}
translate([-inner_curve - thickness, -depth, 0]) {
  cube([thickness, depth, bot_height]);
}
translate([inner_curve + length, -depth, 0]) {
  cube([thickness, depth, bot_height]);
}
translate([-inner_curve - thickness, 0, 0]) rotate(180, [0, 0, 1]) screw_base_clip();
translate([length + inner_curve + thickness, -20, 0]) screw_base();
