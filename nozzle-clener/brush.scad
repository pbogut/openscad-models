$fn = 32;

render_brush = true;

width = 17;
length = 42;
height = 2;


hole_r = 1.5;
hole_space = 2;
hole_bottom_thicknes = 0;

min_edge_space = 2;

module brush() {
    x_holes = (((min_edge_space * 2) + (hole_r * 2) + hole_space) >= width)
        ? 1 : floor((width - (min_edge_space * 2) + hole_space) / (hole_space + (hole_r*2)));

    y_holes = (((min_edge_space * 2) + (hole_r * 2) + hole_space) >= length)
        ? 1 : floor((length - (min_edge_space * 2) + hole_space) / (hole_space + (hole_r*2)));

    echo("x holes", x_holes);
    echo("y holes", y_holes);

    x_shift = (width - ((x_holes * (hole_r*2)) + ((x_holes - 1) * hole_space))) / 2;
    y_shift = (length - ((y_holes * (hole_r*2)) + ((y_holes - 1) * hole_space))) / 2;


    difference() {
        cube([width,length,height]);
        translate([hole_r+x_shift, hole_r+y_shift, hole_bottom_thicknes]) {
            for (x = [0:x_holes - 1]) {
                for (y = [0:y_holes - (x % 2 ? 2 : 1)]) {
                    translate([x * hole_space, y * hole_space + ((x % 2 ? 1 : 0) * (hole_r+(hole_space / 2))), 0]) {
                        translate([hole_r*x*2, hole_r*y*2, 0]) {
                            cylinder(h=height+1, r=hole_r);
                        }
                    }
                }
            }
        }
    }
}

if (render_brush) {
    brush();
}
