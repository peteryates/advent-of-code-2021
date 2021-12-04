require "spec"
require "./game"


describe "Rows" do
  b1 = [
    Board.new("22 13 17 11  0
                8  2 23  4 24
               21  9 14 16  7
                6 10  3 18  5
                1 12 20 15 19"),

    Board.new(" 3 15  0  2 22
                9 18 13 17  5
               19  8  7 25 23
               20 11 10 24  4
               14 21 16 12  6"),

    Board.new("14 21 17 24  4
               10 16 15  9 19
               18  8 23 26 20
               22 11 13  6  5
                2  0 12  3  7"),
  ]

  n1 = "7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1".split(",").map { |n| n.to_i }

  g1 = Game.new(n1, b1)
  g1.play

  it "identifies the right winning board when a row is complete" do
    g1.winning_boards[0].should eq(b1[2])
  end

  it "calculates the winning score correctly" do
    g1.score(0).should eq(4512)
  end
end

describe "Columns" do
  b2 = [
    Board.new("22 13 17 11  0
                8  2 23  4 24
               21  9 14 16  7
                6 10  3 18  5
                1 12 20 15 19"),

    Board.new(" 3 15  0  2 22
                9 18 13 17  5
               19  8  7 25 23
               20 11 10 24  4
               14 21 16 12  6"),

    Board.new("14 21 17 24  4
               10 16 15  9 19
               18  8 23 26 20
               22 11 13  6  5
                2  0 12  3  7"),
  ]

  n2 = "17,23,14,3,20".split(",").map { |n| n.to_i }

  g2 = Game.new(n2, b2)
  g2.play

  it "identifies the right winning board when a column is complete" do
    g2.winning_boards[0].should eq(b2[0])
  end
end
