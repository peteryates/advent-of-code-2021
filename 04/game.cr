class Board
  # the last number that cements victory!
  property! final_number : Int32

  getter rows : Array(Set(Int32))
  getter columns : Array(Set(Int32))

  # numbers that have been called so far
  getter drawn_numbers : Set(Int32)
  getter grid_values : Set(Int32)

  def initialize(raw : String)
    @drawn_numbers = Set(Int32).new

    grid = raw.split("\n").map { |l| l.chomp.split.map { |n| n.to_i } }

    # store the entire grid's values in a flattened set to make
    # working out the unmarked score easier later
    @grid_values = grid.flatten.to_set

    # a set per row and column for easy subset-based win checking
    @rows    = grid.map { |r| r.to_set }
    @columns = grid.transpose.map { |r| r.to_set }
  end

  def check(number : Int32)
    @drawn_numbers.add(number)

    # quick exit if the number's not in our grid
    return false unless grid_values.includes?(number)

    full_row    = @rows.any?    { |r| r.subset_of?(@drawn_numbers) }
    full_column = @columns.any? { |c| c.subset_of?(@drawn_numbers) }

    full_row || full_column
  end

  def complete?
    !@final_number.nil?
  end

  def unmarked
    @grid_values - @drawn_numbers
  end
end

class Game
  # hold an array of winning boards in the order they won so we can
  # easily find the earliest and latest winners by index
  getter winning_boards : Array(Board)

  def initialize(@drawn_numbers : Array(Int32), @boards : Array(Board))
    @winning_boards = [] of Board
  end

  def play
    @drawn_numbers.each_with_index do |n, i|
      @boards.reject { |b| b.complete? }.each do |b|
        if b.check(n)
          b.final_number = n
          @winning_boards << b
        end
      end
    end
  end

  def score(board_index)
    board = @winning_boards[board_index]
    board.unmarked.sum * board.final_number
  end
end
