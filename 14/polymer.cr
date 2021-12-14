class Polymer
  getter rules : Hash(String, String)
  getter seed : String
  getter counts : Hash(String, Int64)

  def initialize(raw : String)
    @rules = Hash(String, String).new
    @counts = Hash(String, Int64).new(0)
    @seed, raw_rules = raw.split("\n\n")
    raw_rules.split("\n").map { |l| l.split(" -> ") }.each { |p| @rules[p[0]] = p[1] }

    seed.size.times { |i| @counts[seed[i, 2]] += 1 }
  end

  def steps(iterations : Int32)
    iterations.times do
      original = @counts.clone
      @counts.clear

      original.each do |k, v|
        mp = @rules[[k[0], k[1]].join] if k.size > 1
        if mp
          @counts[k[0] + mp] += v
          @counts[mp + k[1]] += v
        else
          @counts[k] += v
        end
      end
    end

    self
  end

  def total
    v = @counts.each_with_object(Hash(String, Int64).new(0)) { |(k,v), h| h[k[0].to_s] += v }.values

    v.max - v.min
  end
end
