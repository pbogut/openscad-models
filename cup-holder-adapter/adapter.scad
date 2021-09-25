$fn=64;
bottom = 65;
top = 70;
height = 60;

cutoff = 55;
cutoff2 = 52;
cutoff_offset = 45;

thickness = 2.4;

inner_top = 74;
inner_top2 = 75;
outer_top = inner_top + thickness * 2;;
outer_top2 = inner_top2 + thickness * 2;;
top_h = 35;

connector_h = 10;


module bottom() {
    difference() {
        cylinder(r1=bottom/2, r2=top/2, h=height);
        inner_can();
    }
}


module top() {
    difference() {
        translate([0, 0, height])
            cylinder(h=top_h, r1=outer_top/2, r2=outer_top2/2);
        translate([0, 0, height])
            cylinder(h=top_h, r2=(inner_top2/2), r1=(inner_top/2));
    }
}

module connector() {
    difference() {
        hull() {
            cylinder(r=(top/2), h=1);
            translate([0, 0, connector_h-1])
            cylinder(h=1, r=outer_top/2);
        }
        hull() {
            cylinder(r=(cutoff/2), h=1);
            translate([0, 0, connector_h-1])
            cylinder(h=1, r=(outer_top/2)-(thickness));
        }
    }
}

module inner_can() {
    cylinder(r2=cutoff/2, r1=cutoff2/2, h=height);
}


bottom();
translate([0, 0, connector_h])
    top();

translate([0, 0, height])
    connector();
