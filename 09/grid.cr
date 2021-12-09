class Grid
  getter grid : Array(Array(Int32))
  getter width : Int32
  getter height : Int32
  getter visited_cells : Array(Array(Int32))

  def initialize(raw : String)
    @grid = raw.split("\n").map { |l| l.split("").map(&.to_i) }

    @width = grid[0].size
    @height = grid.size

    @visited_cells = [] of Array(Int32)
  end

  def p1
    low_points.map { |lp| 1 + grid[lp[0]][lp[1]] }.sum
  end

  def p2
    basins.sort_by(&.size).reverse.first(3).map(&.size).product
  end

  def low_points
    ([] of Array(Int32)).tap do |lp|
      grid.each_with_index do |line, y|
        line.each_with_index do |val, x|
          up    = top_edge?(y)    || grid[y-1][x] > grid[y][x]
          right = right_edge?(x)  || grid[y][x+1] > grid[y][x]
          down  = bottom_edge?(y) || grid[y+1][x] > grid[y][x]
          left  = left_edge?(x)   || grid[y][x-1] > grid[y][x]

          lp.push([y, x]) if [up, right, down, left].all?
        end
      end
    end
  end

  def basins
    low_points.map { |lp| walk(lp[0], lp[1]) }
  end

  def walk(y, x) : Array(Int32)
    ([] of Int32).tap do |b|
      return b if visited_cells.includes?([y, x])
      return b if grid[y][x] == 9

      visited_cells << [y, x]
      b.push(grid[y][x])

      b.concat(walk(y - 1, x)) if !top_edge?(y)    && visited?((y - 1), x) # up
      b.concat(walk(y, x + 1)) if !right_edge?(x)  && visited?(y, (x + 1)) # right
      b.concat(walk(y + 1, x)) if !bottom_edge?(y) && visited?((y + 1), x) # down
      b.concat(walk(y, x - 1)) if !left_edge?(x)   && visited?(y, (x - 1)) # left
    end
  end

  def visited?(y, x)
    !visited_cells.includes?([y, x])
  end

  def top_edge?(y)
    y == 0
  end

  def bottom_edge?(y)
    y == height - 1
  end

  def left_edge?(x)
    x == 0
  end

  def right_edge?(y)
    y == width - 1
  end
end
