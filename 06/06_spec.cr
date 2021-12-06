require "spec"
require "./fish_counter"

input = "3,4,3,1,2"

describe "with one fish" do

  it "has the right number of fish after 18 iterations" do
    FishCounter.new(input).iterate(18).count.should eq(26)
  end

  it "has the right number of fish after 26 iterations" do
    FishCounter.new(input).iterate(80).count.should eq(5934)
  end
end


