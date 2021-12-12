class CaveSystem
  getter map : Hash(String, Array(String))

  def initialize(raw : String)
    @map = {} of String => Array(String)

    raw
      .split("\n")
      .map { |l| l.split("-") }
      .each do |pair|
        @map.has_key?(pair[0]) ? (@map[pair[0]] << pair[1]) : (@map[pair[0]] = [pair[1]])
        @map.has_key?(pair[1]) ? (@map[pair[1]] << pair[0]) : (@map[pair[1]] = [pair[0]])
      end
  end

  def p1
    count_paths(visited = ["start"])
  end

  def p2
    count_paths(visited = ["start"], true)
  end

  def count_paths(visited = [] of String, allow_two_visits : Bool = false)
    return 1 if visited.last == "end"

    count = 0

    map[visited.last].each do |n|
      if big?(n) || !visited.includes?(n)
        count += count_paths(visited + [n], allow_two_visits)
      elsif allow_two_visits && !terminus?(n)
        count += count_paths(visited + [n], false)
      end
    end

    count
  end

  def big?(name)
    name.upcase == name
  end

  def terminus?(name)
    name == "start" || name == "end"
  end
end
