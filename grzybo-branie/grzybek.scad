$fn = 64;

base_r = 2;
base_h = 2;
stick_r1 = 4.5;
stick_r2 = 1.5;
stick_h = 8;
hat_r = 5.5;

module hat(r) {
  difference() {
    union() {
      sphere(r-1);
      half_elipse(r, 2.5);
    }
    translate([-r, -r, -r])
    cube([r*2, r*2, r]);
  }
}

module half_elipse(r, h) {
  difference() {
    elipse(r, h);
    translate([-r, -r, -r])
    cube([(h+r)*2, (h+r)*2, r]);
  }
}

module elipse(r, h) {
  real_h = r;
  scale([1, 1, h / real_h]) {
    sphere(r);
  }
}

module mushroom() {

  cylinder(h=base_h, r=base_r);
  translate([0, 0, base_h]) {
    cylinder(h=stick_h, r1=stick_r1-1, r2=stick_r2);
      half_elipse(r=stick_r1, h=4);
    translate([0, 0, stick_h]) {
      hat(hat_r);
    }
  }


}


mushroom();
