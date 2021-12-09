require "spec"
require "./grid"

input = <<-RAW
2199943210
3987894921
9856789892
8767896789
9899965678
RAW

g = Grid.new(input.chomp)

it "finds the low points" do
  g.p1.should eq(15)
end

it "finds the three largest basins and multiplies their size" do
  g.p2.should eq(1134)
end
