outer_width = 60;
outer_depth = 56;
wall_height = 35;

bottom_thickness = 0.3;
wall_thickness = 0.4;

type = "half_short"; //half_short, half_long, quarters

cube([outer_width, outer_depth, bottom_thickness]);
if (type == "half_long" || type == "quarters")
    translate([0, outer_depth / 2, 0])
        cube([outer_width, wall_thickness, wall_height]);
if (type == "half_short" || type == "quarters")
    translate([outer_width / 2, 0, 0])
        cube([wall_thickness, outer_depth, wall_height]);

translate([0, 0, 0])
    cube([outer_width, wall_thickness, wall_height]);
translate([0, outer_depth - wall_thickness, 0])
    cube([outer_width, wall_thickness, wall_height]);
translate([0, 0, 0])
    cube([wall_thickness, outer_depth, wall_height]);
translate([outer_width - wall_thickness, 0, 0])
    cube([wall_thickness, outer_depth, wall_height]);

