module orig() {
  rotate(100, [1, 0, 0])
  import("./MAINBODY10.STL");
}

/* render() */
difference() {
  orig();
  translate([28, -34, 3]) {
    cube([24, 26, 20]);
  }
  translate([32.75, -50, 3]) {
    cube([14.5, 26, 20]);
  }
  translate([34, -10, 6]) {
    rotate(10, [1, 0, 0]) {
      cube([12, 10, 11]);
    }
  }
  translate([28, -8.14468, 3]) {
    rotate(10, [1, 0, 0]) {
      cube([24, 5, 20]);
    }
  }
}
