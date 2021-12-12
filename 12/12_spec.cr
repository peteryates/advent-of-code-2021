require "spec"
require "./cave_system"


describe "Part 1" do
  describe "Sample 1" do
    input_1 = <<-RAW
    start-A
    start-b
    A-c
    A-b
    b-d
    A-end
    b-end
    RAW

    it "finds 10 paths in the first example" do
      CaveSystem.new(input_1.chomp).p1.should eq(10)
    end
  end

  describe "Sample 2" do
    input_2 = <<-RAW
    dc-end
    HN-start
    start-kj
    dc-start
    dc-HN
    LN-dc
    HN-end
    kj-sa
    kj-HN
    kj-dc
    RAW

    it "finds 19 paths in the first example" do
      CaveSystem.new(input_2.chomp).p1.should eq(19)
    end
  end
end

describe "Part 2" do
  describe "Sample 1" do
    input_1 = <<-RAW
    start-A
    start-b
    A-c
    A-b
    b-d
    A-end
    b-end
    RAW

    it "finds 36 paths in the first example" do
      CaveSystem.new(input_1.chomp).p2.should eq(36)
    end
  end

  describe "Sample 2" do
    input_2 = <<-RAW
    dc-end
    HN-start
    start-kj
    dc-start
    dc-HN
    LN-dc
    HN-end
    kj-sa
    kj-HN
    kj-dc
    RAW

    it "finds 103 paths in the first example" do
      CaveSystem.new(input_2.chomp).p2.should eq(103)
    end
  end

  describe "Sample 3" do
    input_3 = <<-RAW
    fs-end
    he-DX
    fs-he
    start-DX
    pj-DX
    end-zg
    zg-sl
    zg-pj
    pj-he
    RW-he
    fs-DX
    pj-RW
    zg-RW
    start-pj
    he-WI
    zg-he
    pj-fs
    start-RW
    RAW

    it "finds 103 paths in the first example" do
      CaveSystem.new(input_3.chomp).p2.should eq(3509)
    end
  end
end
