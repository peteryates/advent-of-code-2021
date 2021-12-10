class Parser
  getter lines : Array(Array(String))

  PAIRS = {
    "{" => "}",
    "[" => "]",
    "(" => ")",
    "<" => ">",
  }

  P1_POINTS = {
    ")" => 3,
    "]" => 57,
    "}" => 1197,
    ">" => 25137,
  }

  P2_POINTS = {
    ")" => 1,
    "]" => 2,
    "}" => 3,
    ">" => 4,
  }

  def initialize(raw : String)
    @lines = raw.split("\n").map(&.split(""))
  end

  def p1
    illegal_characters.map { |c| P1_POINTS[c] }.sum
  end

  def p2 : Int64
    scores = fixes.map do |fix|
      ft = Int64.new(0)

      fix.each do |c|
        ft *= 5
        ft += P2_POINTS[c]
      end

      ft
    end

    scores.sort[scores.size // 2]
  end

  def illegal_characters
    illegal_characters = [] of String

    lines.each do |l|
      open_pairs = [] of String

      l.each do |c|
        if PAIRS.keys.includes?(c)
          open_pairs << (c)
        elsif c == PAIRS[open_pairs.last]
          open_pairs.pop
        else
          illegal_characters.push(c)
          break
        end
      end
    end

    illegal_characters
  end

  def fixes
    required_characters = [] of Array(String)

    lines.each do |l|
      if open_pairs = build_fixes(l)
        required_characters.push(open_pairs.map { |c| PAIRS[c] })
      end
    end

    required_characters.map(&.reverse)
  end

  def build_fixes(chars : Array(String)) : Array(String) | Nil
    open_pairs = [] of String

    chars.each do |c|
      if PAIRS.keys.includes?(c)
        open_pairs << (c)
      elsif c == PAIRS[open_pairs.last]
        open_pairs.pop
      else
        return
      end
    end

    open_pairs
  end
end
