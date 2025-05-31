bot_h = 25;

core_w = 32;
height = 32;
props_r = 38;
space_x = 110 - 10;
space_y = 85 + 10;

corner_r = 20;
corner_a = 90;

thickness = 1.2;

total_width = props_r * 2 + space_x;
total_height = props_r * 2 + space_y;

echo("total_width: ", total_width);
echo("total_height: ", total_height);

module box() {
  translate([-space_x / 2, -space_y / 2, 0]) {
    hull() {
      translate([0, 0, 0]) {
        cylinder(h = height, r = props_r);
        translate([-props_r + corner_r, -props_r + corner_r, 0]) {
          cylinder(h = height, r = corner_r);
        }
      }
      translate([space_x, 0, 0]) {
        cylinder(h = height, r = props_r);
        translate([props_r - corner_r, -props_r + corner_r, 0]) {
          cylinder(h = height, r = corner_r);
        }
      }
      translate([0, space_y, 0]) {
        cylinder(h = height, r = props_r);
        translate([-props_r + corner_r, props_r - corner_r, 0]) {
          cylinder(h = height, r = corner_r);
        }
      }
      translate([space_x, space_y, 0]) {
        cylinder(h = height, r = props_r);
        translate([props_r - corner_r, props_r - corner_r, 0]) {
          cylinder(h = height, r = corner_r);
        }
      }
    }
  }
}

module open_box(t = 1) {
  x_factor = (total_width * 100) / (total_width + t * 2) / 100;
  y_factor = (total_height * 100) / (total_height + t * 2) / 100;

  echo("x_factor: ", x_factor);
  echo("y_factor: ", y_factor);

  difference() {
    box();
    scale([x_factor, y_factor, 1]) {
      box();
    }
  }
}

module pieEdge(a, r, h, rot = 0) {
  difference() {
    pieSlice(a, r, h, rot);
    cylinder(h = h, r = r - 1);
  }
}

module pieSlice(a, r, h, rot = 0) {
  // a:angle, r:radius, h:height
  rotate(rot, [0, 0, 1]) {
    rotate_extrude(angle = a) {
      square([r, h]);
    }
  }
}

module core() {
  core_lock_r = 7;
  core_lock_h = 10;
  enforcer_shift = 20;
  core_lock2_r = 3;

  translate([-core_w / 2, -total_height / 2 + thickness, 0]) {
    cube([core_w, total_height - thickness - 55, thickness]);
  }

  module backtocenter() {
    translate([space_x / 2, space_y / 2, 0]) {
      cylinder(h = thickness, r = 5);
    }
  }
  cylinder(h = thickness, r = core_w / 2);
  cylinder(h = core_lock_h, r = core_lock_r);
  translate([0, 24, 0]) {
    cylinder(h = core_lock_h, r = core_lock2_r);
  }
  translate([0, -24, 0]) {
    cylinder(h = core_lock_h, r = core_lock2_r);
  }
  translate([-space_x / 2, -space_y / 2, 0]) {
    hull() {
      translate([0, -enforcer_shift, 0]) {
        backtocenter();
      }
      translate([space_x, 0, 0]) {
        translate([props_r - corner_r, -props_r + corner_r, 0]) {
          pieEdge(a = corner_a, rot = 270 + (90 - corner_a) / 2, h = thickness, r = corner_r);
        }
      }
      // }
      // hull() {
      translate([0, -enforcer_shift, 0]) {
        backtocenter();
      }
      translate([0, 0, 0]) {
        translate([-props_r + corner_r, -props_r + corner_r, 0]) {
          pieEdge(a = corner_a, rot = 180 + (90 - corner_a) / 2, h = thickness, r = corner_r);
        }
      }
      // }
      // hull() {
      translate([0, enforcer_shift, 0]) {
        backtocenter();
      }
      translate([0, space_y, 0]) {
        translate([-props_r + corner_r, props_r - corner_r, 0]) {
          pieEdge(a = corner_a, rot = 90 + (90 - corner_a) / 2, h = thickness, r = corner_r);
        }
      }
      // }
      // hull() {
      translate([0, enforcer_shift, 0]) {
        backtocenter();
      }
      translate([space_x, space_y, 0]) {
        translate([props_r - corner_r, props_r - corner_r, 0]) {
          pieEdge(a = corner_a, rot = 0 + (90 - corner_a) / 2, h = thickness, r = corner_r);
        }
      }
    }
  }
}

module core_bot() {
  core_lock_r = 5;
  core_lock_h = 10;
  shift1 = 46 / 2;
  shift2 = 37 / 2;

  translate([shift1, shift2, 0]) {
    cylinder(h = core_lock_h, r = core_lock_r);
  }
  translate([shift1, -shift2, 0]) {
    cylinder(h = core_lock_h, r = core_lock_r);
  }
  translate([-shift1, shift2, 0]) {
    cylinder(h = core_lock_h, r = core_lock_r);
  }
  translate([-shift1, -shift2, 0]) {
    cylinder(h = core_lock_h, r = core_lock_r);
  }

  // dowyjebbania

  translate([-space_x / 2, -space_y / 2, 0]) {
    hull() {
      translate([space_x, 0, 0]) {
        translate([props_r - corner_r, -props_r + corner_r, 0]) {
          pieEdge(a = corner_a, rot = 270 + (90 - corner_a) / 2, h = thickness, r = corner_r);
        }
      }
      translate([space_x / 2, space_y / 2, 0]) {
        translate([-shift1, shift2, 0]) {
          cylinder(h = 1, r = core_lock_r);
        }
      }
    }
    hull() {
      translate([0, 0, 0]) {
        translate([-props_r + corner_r, -props_r + corner_r, 0]) {
          pieEdge(a = corner_a, rot = 180 + (90 - corner_a) / 2, h = thickness, r = corner_r);
        }
      }
      translate([space_x / 2, space_y / 2, 0]) {
        translate([shift1, shift2, 0]) {
          cylinder(h = 1, r = core_lock_r);
        }
      }
    }
    hull() {
      translate([0, space_y, 0]) {
        translate([-props_r + corner_r, props_r - corner_r, 0]) {
          pieEdge(a = corner_a, rot = 90 + (90 - corner_a) / 2, h = thickness, r = corner_r);
        }
      }
      translate([space_x / 2, space_y / 2, 0]) {
        translate([shift1, -shift2, 0]) {
          cylinder(h = 1, r = core_lock_r);
        }
      }
    }
    hull() {
      translate([space_x, space_y, 0]) {
        translate([props_r - corner_r, props_r - corner_r, 0]) {
          pieEdge(a = corner_a, rot = 0 + (90 - corner_a) / 2, h = thickness, r = corner_r);
        }
      }
      translate([space_x / 2, space_y / 2, 0]) {
        translate([-shift1, -shift2, 0]) {
          cylinder(h = 1, r = core_lock_r);
        }
      }
    }
  }

  // REAL BOTTOM
  // translate([-space_x / 2, -space_y / 2, 0]) {
  //   hull() {
  //     translate([space_x, 0, 0]) {
  //       translate([props_r - corner_r, -props_r + corner_r, 0]) {
  //         pieEdge(a = corner_a, rot = 270 + (90 - corner_a) / 2, h = thickness, r = corner_r);
  //       }
  //     }
  //     translate([0, 0, 0]) {
  //       translate([-props_r + corner_r, -props_r + corner_r, 0]) {
  //         pieEdge(a = corner_a, rot = 180 + (90 - corner_a) / 2, h = thickness, r = corner_r);
  //       }
  //     }
  //     translate([0, space_y, 0]) {
  //       translate([-props_r + corner_r, props_r - corner_r, 0]) {
  //         pieEdge(a = corner_a, rot = 90 + (90 - corner_a) / 2, h = thickness, r = corner_r);
  //       }
  //     }
  //     translate([space_x, space_y, 0]) {
  //       translate([props_r - corner_r, props_r - corner_r, 0]) {
  //         pieEdge(a = corner_a, rot = 0 + (90 - corner_a) / 2, h = thickness, r = corner_r);
  //       }
  //     }
  //   }
  // }
}

module box_bot() {
  bot_t = thickness + 1.2;
  difference() {
    open_box(bot_t);
    translate([0, 0, 10]) {
      open_box(thickness + 0.4);
    }
  }
}

render() {
  box_bot();
  core_bot();
}

// Top
// render() {
//   core();
//   open_box(thickness);
// }
