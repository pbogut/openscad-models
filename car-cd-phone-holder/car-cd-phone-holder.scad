/* $fn = 100; */
/* inner_width = 144; // landscape */
inner_width = 73; // portrait
inner_height = 20;
insert_width = 120;
insert_depth = 40;
float_left = true;
rad = 5;
thickness = 1.2;
insert_thickness = 1.6;
depth = 11;
width = inner_width + (thickness * 2) - (2 * rad);
height = inner_height + (thickness * 2) - (2 * rad);
rant = 7;
over = 70;
/* bend_angle=5; */
bend_angle=0; // prints better
side_angle=6;
cd_sensor_l=23;
cd_sensor_w=6;
to_the_left = float_left ? -(insert_width - inner_width) / 2 : 0;

module baseblock(w=55, h=96, r=5, t=9) {
  hull() {
    cylinder(t, r=r);
    translate([w, 0, 0]) {
      translate([0, h, 0]) cylinder(t, r=r);
      cylinder(t, r=r);
      cylinder(t, r=r);
    }
    translate([0, h, 0]) cylinder(t, r=r);
  }
}



module phonecase() {
  rrant = rant * 2;
  hrant = rant;
  difference() {
    baseblock(w=width, h=height, t=depth);
    hull() {
      translate([thickness, thickness, thickness])
        baseblock(w=width - (thickness * 2), h=height * 2, t=depth - (thickness * 2));
      translate([thickness + rrant, thickness + rrant, thickness])
        baseblock(w=width - ((thickness + rrant) * 2), h=height - (thickness * 2), t=depth);
    }
    translate([width * 1.5, height+rad, rad+thickness])
      rotate(-90, [0, 1, 0])
        cylinder(width * 2, r=rad);
    translate([thickness + hrant, thickness + rrant + over, -thickness])
        baseblock(w=width - ((thickness + hrant) * 2), h=height - (thickness * 2), t=depth);
  }
}
module phonecase_gap() {
  translate([0, -rad, 0])
    translate([to_the_left,0,0])
      cube([width,insert_thickness,depth]);
}

module insert() {

  module sensor_slot() {
      cube([cd_sensor_w, insert_depth, insert_thickness]);
      /* translate([2.5, insert_depth-10, 0]) */
        /* cylinder(r=5, h=insert_thickness); */
      difference() {
        translate([-5, insert_depth-14, 0])
          cube([cd_sensor_w+10, 10, insert_thickness]);
        translate([-5, insert_depth-14, 0])
          cylinder(r=5, h=insert_thickness, $fn=30);
        translate([5+cd_sensor_w, insert_depth-14, 0])
          cylinder(r=5, h=insert_thickness, $fn=30);
      }
  }

  module lock_teeth(size=5) {
    intersection() {
      cube([insert_width, 50, size]);
      translate([0,-size / 2,0])
        rotate(-25, [1,0,0])
      cube([insert_width, 50, size]);
    }
  }

  render() {
    difference() {
      hull() {
        cylinder(10, h=insert_thickness);
        translate([insert_width, 0, 0]) cylinder(10, h=insert_thickness);
        translate([5, insert_depth, 0]) cylinder(10, h=insert_thickness);
        translate([insert_width-5, insert_depth, 0]) cylinder(10, h=insert_thickness);
      }
      translate([cd_sensor_l, 10, 0])
        sensor_slot();
      translate([insert_width - cd_sensor_l - cd_sensor_w, 10, 0])
        sensor_slot();
    }
  }
  limit_r=2;
  translate([0,0, limit_r])
    rotate(90, [0,1,0])
      cylinder(insert_width, r=limit_r, $fn=30);

  translate([cd_sensor_l + cd_sensor_w, 7, limit_r])
    rotate(90, [0,1,0])
      cylinder(insert_width-(2*cd_sensor_l)-(2*cd_sensor_w), r=limit_r, $fn=30);
  /* translate([0,7, insert_thickness]) */
  /*   lock_teeth(2); */
  /* translate([0,14, insert_thickness]) */
  /*   lock_teeth(1.6); */
  /* translate([0,21, insert_thickness]) */
  /*   lock_teeth(1.2); */
}

module insert_gap() {
  cube([insert_width+thickness, thickness, insert_thickness]);
}

translate([-width / 2,0,0]) {
  translate([to_the_left,0,0]) {
    rotate(90, [1,0,0]) {
      rotate(side_angle, [0,-1,0])
        rotate(bend_angle, [-1,0,0])
          phonecase();
    }
  }

  translate([0-((insert_width - width) / 2), thickness, -rad])
    insert();

// fill gap between insert and phone case
hull() {
  rotate(90, [1,0,0]) {
    rotate(side_angle, [0,-1,0])
      phonecase_gap();
  }
  translate([0-((insert_width - width) / 2), thickness, -rad])
    insert_gap();
}


}
