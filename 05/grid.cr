class Line
  getter :start_x, :start_y, :finish_x, :finish_y

  property! x : Int32, y : Int32

  def initialize(@start_x : Int32, @start_y : Int32, @finish_x : Int32, @finish_y : Int32)
    @x = @start_x
    @y = @start_y
  end

  def horizontal?
    @start_x == @finish_x
  end

  def vertical?
    @start_y == @finish_y
  end

  def max_x
    [@start_x, @finish_x].max
  end

  def max_y
    [@start_y, @finish_y].max
  end

  def reset_x_and_y!
    @x = @start_x
    @y = @start_y
  end
end

class Grid
  getter lines : Array(Line)
  getter data : Array(Array(Int32))

  def initialize(lines : String)
    @lines = lines
      .chomp
      .split("\n")
      .map { |l| l.split(" -> ") }
      .map { |p| p.map(&.split(",")).flatten.map(&.to_i) }
      .map { |c| Line.new(c[0], c[1], c[2], c[3]) }

    @data = Array.new(height) { Array.new(width) { 0 } }
  end

  def reset_data!
    @data = Array.new(height) { Array.new(width) { 0 } }
    @lines.each { |l| l.reset_x_and_y! }
  end

  def build_horizontal_and_vertical_lines
    build(@lines.select { |l| l.horizontal? || l.vertical? })
  end

  def build_all_lines
    build(@lines)
  end

  def build(lines : Array(Line))
    lines.each do |l|
      # add the starting point of the line
      data[l.start_y][l.start_x] += 1

      # now step from the start point to the end point
      # one cell at a time, keeping a log of where we
      # are in x,y and incrementing the cell count in
      # our data grid
      while (l.x != l.finish_x || l.y != l.finish_y)
        l.x += 1 if l.x < l.finish_x
        l.y += 1 if l.y < l.finish_y
        l.x -= 1 if l.x > l.finish_x
        l.y -= 1 if l.y > l.finish_y
        data[l.y][l.x] += 1
      end
    end
  end

  def width
    @lines.map(&.max_x).max + 1
  end

  def height
    @lines.map(&.max_y).max + 1
  end

  def danger_cells
    data.flatten.count { |v| v >= 2 }
  end
end
