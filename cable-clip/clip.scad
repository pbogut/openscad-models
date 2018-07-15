$fn = 50;

thickness = 0.6;
diameter = 5;
height = 5;
elements = 5;


module unit(d = diameter, t = thickness) {
  out_r = (d / 2) + t;
  in_r = d / 2;

  rotate(45, [0, 0, 1])
    difference() {
      cylinder(height, r=out_r);
      cylinder(height, r=in_r);
      cube([d, d, height]);
    }
}


module tape(n = elements, d = diameter, t = thickness, support = false) {
  space = d + t;
  for(i = [0 : n-1]) {
    translate([i * space, 0, 0])
      unit();
  }
  if (support) {
    translate([0, -(d / 2 + t), 0])
      cube([space * (n - 1), t, height]);
  }
}


module mixed_tape(elements, t = thickness, support = false) {
  function add(list, stop = len(list), i = 0, acc = 0) =
    i <= stop
      ? add(list, stop = stop, i = i + 1, acc = acc + list[i])
      : acc;

  for (idx = [0 : len(elements)]) {
    space = add(elements, stop = idx, acc = t);
    d = elements[idx];
    translate([space + t, (d / 2), 0])
      unit(d = d);
    newspace = space + d;
  }

  if (support) {
    space = add(elements, stop = len(elements)-2);
    shift = add(elements, stop = 0);
    echo (space);
    translate([shift, -t, 0])
      cube([space * len(elements), thickness, height]);
  }
}

tape(support = true);
/* mixed_tape([5,5,6,6,6,7,8,9,9,9], support = true); */
