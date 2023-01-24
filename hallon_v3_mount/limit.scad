$fn=64;
height=20;

shift=15;
thick=3;


module side_mount() {
  translate([0, 5, 0]) {
    cube([height, 3, shift]);
  }
  render() {
    translate([0, 25, 0+shift]){
      rotate(90, [0, 1, 0]) {
        difference() {
          cylinder(h=height, r=20);
          cylinder(h=height, r=17);
          translate([0, -25, 0]) {
            cube([25, 50, height]);
          }
          translate([-25, -10, 0]) {
            cube([25, 50, height]);
          }
        }
      }
    }
  }

  translate([-16, 0, 0]) {
    difference() {
      hull() {
        cylinder(h=thick, r=5);
        translate([31, 0, 0]) {
          cylinder(h=thick, r=5);
          translate([-5, -5, 0]) {
            cube([10, 10, thick]);
          }
        }

      }
      cylinder(h=5, r=1.5);
      translate([31, 0, 0]) {
        cylinder(h=5, r=1.5);
      }
      translate([0, 0, thick-1]) {
        cylinder(h=5, r=2.5);
      }
      translate([31, 0, thick-1]) {
        cylinder(h=5, r=2.5);
      }
    }
  }

  translate([0, 15, 13.7+shift]) {
    difference() {
      cube([height, 10, 3.6]);
      translate([5, 5, 0]) {
        cylinder(h=5, r=1.5);
      }
      translate([height - 5, 5, 0]) {
        cylinder(h=55, r=1.5);
      }
    }
  }
}

module stopper() {
  translate([0, 21, 0]) {
    difference() {
      cube([20, 40, 3]);
      hull() {
        translate([5, 5, 0]) {
          cylinder(h=5, r=1.5);
        }
        translate([5, 30, 0]) {
          cylinder(h=5, r=1.5);
        }
      }
      hull() {
        translate([height - 5, 5, 0]) {
          cylinder(h=55, r=1.5);
        }
        translate([height - 5, 30, 0]) {
          cylinder(h=55, r=1.5);
        }
      }
    }

    translate([0, 37, 0]) {
      cube([20, 3, 30]);
    }
  }
}

translate([0, 0, 20])
  rotate(90, [0, 1, 0]) {
    side_mount();
    stopper();
  }
