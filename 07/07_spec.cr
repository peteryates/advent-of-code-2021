require "spec"
require "./target_finder"

input = "16,1,2,0,4,2,7,1,2,14"

it "calculates the most efficient position for part 1" do
  TargetFinder.new(input).calculate.should eq(37)
end

it "crabculates the most efficient position for part 2" do
  TargetFinder.new(input).crabculate.should eq(168)
end
