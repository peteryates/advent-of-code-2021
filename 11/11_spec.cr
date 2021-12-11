require "spec"
require "./grid"

input = <<-INPUT
5483143223
2745854711
5264556173
6141336146
6357385478
4167524645
2176841721
6882881134
4846848554
5283751526
INPUT

it "calculates the right number of flashes after 100 steps" do
  Grid.new(input.chomp).p1(100).should eq(1656)
end

it "continues for the right number of steps before all cells flash at once" do
  Grid.new(input.chomp).p2.should eq(195)
end
