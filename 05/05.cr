require "./grid"

g = Grid.new(File.read("input.txt"))
g.build_horizontal_and_vertical_lines

puts "Part 1: #{g.danger_cells}"

g.reset_data!
g.build_all_lines

puts "Part 2: #{g.danger_cells}"
