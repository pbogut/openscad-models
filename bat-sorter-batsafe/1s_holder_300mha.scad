cols = 2;
rows = 9;

walls = 1.2;
bottom = 1.2;

width = 12;
depth = 7.6;

height = 25;

echo(rows* depth + (rows + 1) * depth);
render() {
  difference() {
    cube([cols * width + (cols + 1) * walls, rows * depth + (rows + 1) * walls, height + bottom]);
    for (i = [0:cols - 1]) {
      for (j = [0:rows - 1]) {
        translate([i * width + walls * (i + 1), j * depth + walls * (j + 1), bottom]) {
          cube([width, depth, height]);
        }
      }
    }
  }
}
