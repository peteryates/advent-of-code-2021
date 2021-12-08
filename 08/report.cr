class Report
  getter entries : Array(Entry)

  def initialize(raw)
    @entries = raw.split("\n").map { |l| Entry.new(l) }
  end

  def output
    entries.map(&.decode)
  end

  def debug
    entries.map(&.decode).each { |e| puts e.join(",") }
  end

  def p1
    entries.map(&.unique_glyphs).flatten.size
  end

  def p2
    entries.map(&.converted_output).map(&.to_i).sum
  end
end

class Entry
  getter signal : Array(String)
  getter output : Array(String)
  getter mapping : Hash(String, String)

  def initialize(line : String)
    @signal, @output = line.split(" | ").map { |c| c.split.map(&.split("").sort.join) }
    @mapping = positions(signal)
  end

  def unique_glyphs
    unique = mapping.values_at("1", "4", "7", "8")

    output.select { |v| unique.includes?(v) }
  end

  def converted_output
    output.map { |c| mapping.invert.fetch(c, "_") }.join
  end

  def positions(signal : Array(String)) : Hash(String, String)
    Hash(String, String).new.tap do |m|
      (0..9).map do |i|
        length = signal[i].size
        case
        when length == 2 then m["1"] = signal[i]
        when length == 4 then m["4"] = signal[i]
        when length == 3 then m["7"] = signal[i]
        when length == 7 then m["8"] = signal[i]
        else
          nil
        end
      end

      signal.select { |s| s.size == 5 }.each do |s|
        m["3"] = s if (overlap?(s, m["1"], 2))
      end

      signal.select { |s| s.size == 5 }.each do |s|
        m["5"] = s if (overlap?(s, m["4"], 3) && s != m["3"])
      end

      signal.select { |s| s.size == 5 }.each do |s|
        m["2"] = s if (s != m["3"] && s != m["5"])
      end

      signal.select { |s| s.size == 6 }.each do |s|
        m["6"] = s if overlap?(s, m["3"], 4) && overlap?(s, m["7"], 2)
      end

      signal.select { |s| s.size == 6 }.each do |s|
        m["9"] = s if overlap?(s, m["7"], 3) && overlap?(s, m["4"], 4)
      end

      signal.select { |s| s.size == 6 }.each do |s|
        m["0"] = s if overlap?(s, m["8"], 6) && s != m["6"] && s != m["9"]
      end
    end
  end

  def overlap?(signal : String, target : String, amount : Int32)
    (signal.chars.to_set & target.chars.to_set).size == amount
  end
end
