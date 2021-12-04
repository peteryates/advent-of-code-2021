require "./game"

########
# prep #
########

game_data = File
  .read("input.txt")
  .split("\n\n")

drawn_numbers = game_data.shift.split(",").map(&.to_i)
boards = game_data.map { |b| Board.new(b.chomp) }
game = Game.new(drawn_numbers, boards)
game.play

##########
# part 1 #
##########

puts "First board to win's score: #{game.score(0)}"

##########
# part 2 #
##########

puts "Last board to win's score: #{game.score(-1)}"
