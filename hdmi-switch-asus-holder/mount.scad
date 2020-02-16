$fn = 32;

hole_r = 1.75;
distance1 = 14;
distance2 = 3;


m_width=30;
m_depth=16;
/* m_height=3; */
m_height=4;
m_base=2;



h_inner_width=78.5;
h_inner_height=15.5;
h_inner_depth=52;
h_thickness=2;


h_outer_width = h_inner_width+(h_thickness*2);
h_outer_height = h_inner_height+(h_thickness*2);
h_outer_depth = h_inner_depth;

render()
main();

module main() {
        translate([(h_outer_width/2)-(m_width/2), (h_outer_depth/2)-(m_depth/2), h_outer_height-h_thickness])
        mount();
        holder();
}

module holder() {

    hdmi_h=6.5;
    hdmi_w=17;

    width = h_inner_width+(h_thickness*2);
    height = h_inner_height+(h_thickness*2);
    depth = h_inner_depth;
    difference() {
        cube([width, depth, height]);
        translate([h_thickness, 0, h_thickness])
        cube([h_inner_width, depth, h_inner_height]);

        translate([0, (depth/2)-(hdmi_w/2), (height/2)-(hdmi_h/2)])
            cube([h_thickness*2, hdmi_w, hdmi_h]);

        translate([(h_outer_width-m_width)/2, (h_outer_depth - m_depth)/2, 0])
            cube([m_width, m_depth, h_outer_height]);
    }
}

module mount() {
    difference() {
        union() {
            hull() {
                cube([m_width, m_depth, m_base]);
                translate([m_height/2, m_height/2, m_height])
                    cube([m_width-m_height, m_depth-m_height, 1]);
            }
        }
        translate([(m_width/2), (m_depth/2)-(distance2/2), 0])
            cylinder(h=m_height+1, r=hole_r);
        translate([(m_width/2)-(distance1/2), (m_depth/2)+(distance2/2), 0]) {
            cylinder(h=m_height+1, r=hole_r);
            translate([distance1, 0, 0])
                cylinder(h=m_height+1, r=hole_r);
        }
    }
}


