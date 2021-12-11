class Grid
  def initialize(raw : String)
    @flashes = 0
    @cells = {} of Array(Int32) => Int32
    @flashed = [] of Array(Int32)

    raw.split("\n").each_with_index do |row, y|
      row.split("").each_with_index do |col, x|
        @cells[[y, x]] = col.to_i
      end
    end
  end

  def p1(iterations : Int32 = 100)
    iterations.times { step }

    @flashes
  end

  def p2
    (1..).each { |i| step; break i if @flashed.size == 100 }
  end

  def step
    @flashed = [] of Array(Int32)
    @cells.each { |cell, _v| @cells[cell] += 1 }
    @cells
      .select { |_k, energy| energy > 9 }
      .each { |cell, _v| flash(cell) }
  end

  def flash(cell)
    @cells[cell] = 0
    return if @flashed.includes? cell

    @flashed << cell
    @flashes += 1

    adjacent_cells(cell[1], cell[0]).each do |ac|
      next if @flashed.includes? ac

      @cells[ac] += 1
      flash(ac) if @cells[ac] > 9
    end
  end

  def adjacent_cells(y, x)
    [
      [[x - 1, 0].max, [y - 1, 0].max], # above left
      [x, [y - 1, 0].max],              # above
      [[x + 1, 9].min, [y - 1, 0].max], # above right
      [[x - 1, 0].max, y],              # left
      [[x + 1, 9].min, y],              # right
      [[x - 1, 0].max, [y + 1, 9].min], # below left
      [x, [y + 1, 9].min],              # below
      [[x + 1, 9].min, [y + 1, 9].min], # below right
    ].uniq
  end
end
