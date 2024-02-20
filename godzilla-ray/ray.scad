cylinder(h = 20, r = 1.8, $fn = 64);

module kleks() {
  translate([4, 0, 0]) {
    cylinder(h = 1, r = 4, $fn = 64);
  }
  translate([3, 3, 0]) {
    cylinder(h = 1, r = 4, $fn = 64);
  }
  translate([-1, -3, 0]) {
    cylinder(h = 1, r = 4, $fn = 64);
  }
  translate([-1, 2, 0]) {
    cylinder(h = 1, r = 6, $fn = 64);
  }
  translate([0, 7, 0]) {
    cylinder(h = 1, r = 3, $fn = 64);
  }
}

translate([0, 0, 5]) {
  cylinder(h = 80, r1 = 2, r2 = 10, $fn = 64);
}

module promien() {
  hull() {
    kleks();
    translate([0, 0, 80]) {
      scale([0.2, 0.2, 0.2]) kleks();
    }
  }

  translate([0, 0.2, 65]) {
    cylinder(h = 20, r = 2, $fn = 64);
  }

  translate([0, 3, 60]) {
    sphere(r = 2);
  };
  translate([0, -3, 50]) {
    sphere(r = 2);
  };
  translate([-1, -2, 40]) {
    sphere(r = 3);
  };
  translate([3, 3, 30]) {
    sphere(r = 3);
  };
  translate([0, 6.5, 20]) {
    sphere(r = 3);
  };
  translate([0, -5.5, 10]) {
    sphere(r = 3);
  };
}

!promien();
