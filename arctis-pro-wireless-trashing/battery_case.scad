in_width = 34;
in_height = 49.6;
in_depth = 6;

bat_con_depth_with_cables = 10;
bat_con_h = 4;
bat_con_with_ears_w = 21;
bat_con_no_ears_w = 15;
bat_con_to_ears_depth = 2;
bat_con_ear_thickness = 1;

steps = [8.5, 11, 13.5];
touch_block_w = 20;
touch_block_h = 6;

touch_w = 1.4;

module cylinder_or_cube(h, r, is_cube = false) {
  if (is_cube) {
    translate([-r, -r, 0]) {
      cube([r * 2, r * 2, h]);
    }
  } else {
    cylinder(h = h, r = r, center = false);
  }
}

module bat_con(cutoff = false) {
  $fn = 32;
  additional_depth = cutoff ? bat_con_h : 0;
  additional_ear_w = cutoff ? 0.2 : 0;
  additional_ear_t = cutoff ? 0.2 : 0;
  echo(additional_depth);
  module bat_con_base() {
    hull() {
      rotate(90, [0, 1, 0]) {
        cylinder_or_cube(h = bat_con_h + additional_depth, r = bat_con_h / 2, is_cube = cutoff);
      }
      translate([0, bat_con_no_ears_w - bat_con_h, 0]) {
        rotate(90, [0, 1, 0]) {
          cylinder_or_cube(h = bat_con_h + additional_depth, r = bat_con_h / 2, is_cube = cutoff);
        }
      }
    }
  }
  module bat_con_ears() {
    hull() {
      translate([0, -(additional_ear_w / 2), 0]) {
        rotate(90, [0, 1, 0]) {
          cylinder_or_cube(
              h = bat_con_ear_thickness + additional_ear_t, r = bat_con_h / 2, is_cube = cutoff
          );
        }
      }
      translate([0, (bat_con_with_ears_w - bat_con_h) + (additional_ear_w / 2), 0]) {
        rotate(90, [0, 1, 0]) {
          cylinder_or_cube(
              h = bat_con_ear_thickness + additional_ear_t, r = bat_con_h / 2, is_cube = cutoff
          );
        }
      }
    }
  }
  bat_con_base();
  shift = (bat_con_with_ears_w - bat_con_no_ears_w) / -2;
  translate([bat_con_to_ears_depth, shift, 0]) {
    bat_con_ears();
  }
}

module battery_box() {
  difference() {
    cube([38, 63, 6.8]);
    translate([2, 5, 0.8]) {
      translate([in_width / 2, 1, 6]) {
        sphere(5);
      }
      cube([in_width, in_height, in_depth + 1]);
      for (i = [0, bat_con_h]) {
        translate([16, in_height - 0.0001, 3 + i]) {
          rotate(90, [0, 0, 1]) {
            bat_con(true);
          }
        }
      }
    }
  }
}

render() {
  battery_box();
}
