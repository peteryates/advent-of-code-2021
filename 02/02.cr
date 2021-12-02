########
# prep #
########

struct Movement
  property :direction, :distance

  def initialize(@direction : String, @distance : Int32)
  end
end

movements = File
  .read_lines("input.txt")
  .map { |l| l.chomp.split }
  .map { |m| Movement.new(direction: m[0], distance: m[1].to_i) }

##########
# part 1 #
##########

class SubmarineP1
  getter :x, :y

  def initialize(@x : Int32 = 0, @y : Int32 = 0)
  end

  def move(m : Movement)
    case m.direction
    when "forward"
      @x += m.distance
    when "up"
      @y -= m.distance
    when "down"
      @y += m.distance
    end
  end
end

s1 = SubmarineP1.new
movements.each { |movement| s1.move(movement) }
puts "Part 1: #{s1.x * s1.y}"

##########
# part 2 #
##########

class SubmarineP2
  getter :x, :y

  def initialize(@x : Int32 = 0, @y : Int32 = 0, @aim : Int32 = 0)
  end

  def move(m : Movement)
    case m.direction
    when "forward"
      @x += m.distance
      @y += @aim * m.distance
    when "up"
      @aim -= m.distance
    when "down"
      @aim += m.distance
    end
  end
end

s2 = SubmarineP2.new
movements.each { |movement| s2.move(movement) }
puts "Part 2: #{s2.x * s2.y}"
