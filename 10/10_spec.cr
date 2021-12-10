require "spec"
require "./parser"

input = <<-RAW
[({(<(())[]>[[{[]{<()<>>
[(()[<>])]({[<{<<[]>>(
{([(<{}[<>[]}>{[]{[(<()>
(((({<>}<{<{<>}{[]{[]{}
[[<[([]))<([[{}[[()]]]
[{[{({}]{}}([{[{{{}}([]
{<[[]]>}<{[{[{[]{()[[[]
[<(<(<(<{}))><([]([]()
<{([([[(<>()){}]>(<<{{
<{([{{}}[<[[[<>{}]]]>[]]
RAW

describe "Part 1" do
  it "finds the correct error score 1" do
    Parser.new("(]").p1.should eq(57)
  end

  it "finds the correct error score 2" do
    Parser.new("{()()()>").p1.should eq(25137)
  end

  it "finds the correct error score 3" do
    Parser.new("(((()))}").p1.should eq(1197)
  end

  it "finds the correct total" do
    Parser.new(input.chomp).p1.should eq(26397)
  end
end

describe "Part 2" do
  it "finds the correct total" do
    Parser.new(input.chomp).p2.should eq(288957)
  end
end
