require "spec"
require "./polymer"

input = <<-RAW
NNCB

CH -> B
HH -> N
CB -> H
NH -> C
HB -> C
HC -> B
HN -> C
NN -> C
BH -> H
NC -> B
NB -> B
BN -> B
BB -> N
BC -> B
CC -> N
CN -> C
RAW

it "after ten steps" do
  Polymer.new(input.chomp).steps(10).total.should eq(1588)
end

it "after forty steps" do
  Polymer.new(input.chomp).steps(40).total.should eq(2188189693529)
end
