class TargetFinder
  getter positions : Hash(Int32, Int32)

  def initialize(values : String)
    @positions = values.split(",").map(&.to_i).tally
  end

  def furthest_right
    positions.keys.max
  end

  def calculate
    distance { |i| positions.map { |p, c| ((i - p).abs * c) }.sum  }
  end

  def crabculate
    stash = Hash(Int32, Int32).new

    distance { |i| positions.map { |p, c| c * (stash[i - p] ||= (0..(i - p).abs).sum) }.sum }
  end

  private def distance
    (0..furthest_right).map { |i| yield(i) }.min
  end
end
