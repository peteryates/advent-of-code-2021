require "spec"
require "./sheet"

input = <<-RAW
6,10
0,14
9,10
0,3
10,4
4,11
6,0
6,12
4,1
0,13
10,12
3,4
3,0
8,4
1,10
2,14
8,10
9,0

fold along y=7
fold along x=5
RAW

it "the right number of points are visible when folded once" do
  s1 = Sheet.new(input.chomp)
  # s1.debug
  s1.fold(1)
  # s1.debug
  s1.visible_points.should eq(17)
end

it "the right number of points are visible when folded twice" do
  s2 = Sheet.new(input.chomp)
  # s2.debug
  s2.fold(2)
  # s2.debug
  s2.visible_points.should eq(16)
end
