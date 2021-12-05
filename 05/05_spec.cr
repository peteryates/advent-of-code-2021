require "spec"
require "./grid"

input = <<-SAMPLE
0,9 -> 5,9
8,0 -> 0,8
9,4 -> 3,4
2,2 -> 2,1
7,0 -> 7,4
6,4 -> 2,0
0,9 -> 2,9
3,4 -> 1,4
0,0 -> 8,8
5,5 -> 8,2
SAMPLE

describe "Just horizontal and vertical lines" do
  # .......1..
  # ..1....1..
  # ..1....1..
  # .......1..
  # .112111211
  # ..........
  # ..........
  # ..........
  # ..........
  # 222111....

  g = Grid.new(input)
  g.build_horizontal_and_vertical_lines

  it "correctly determine the number of points where at least two lines overlap" do
    g.danger_cells.should eq(5)
  end
end

describe "All lines including diagonals" do
  # 1.1....11.
  # .111...2..
  # ..2.1.111.
  # ...1.2.2..
  # .112313211
  # ...1.2....
  # ..1...1...
  # .1.....1..
  # 1.......1.
  # 222111....

  g = Grid.new(input)
  g.build_all_lines

  it "correctly determine the number of points where at least two lines overlap" do
    g.danger_cells.should eq(12)
  end
end
