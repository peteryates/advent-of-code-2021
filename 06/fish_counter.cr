class FishCounter
  getter fish : Hash(Int32, Int64)

  def initialize(fish : String)
    input = fish.split(",").map(&.to_i64)

    @fish = Hash(Int32, Int64).new

    (0..8).each do |i|
      @fish[i] = input.count(i).to_i64
    end
  end

  def iterate(number : Int32)
    (0..number-1).each do
      orig = fish.dup

      fish[0] = orig[1]
      fish[1] = orig[2]
      fish[2] = orig[3]
      fish[3] = orig[4]
      fish[4] = orig[5]
      fish[5] = orig[6]
      fish[6] = orig[7] + orig[0]
      fish[7] = orig[8]
      fish[8] = orig[0]
    end

    self
  end

  def count : Int64
    fish.values.sum
  end
end
