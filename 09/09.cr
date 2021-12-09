require "./grid"

g = Grid.new(File.read("input.txt").chomp)

puts "Part 1: #{g.p1}"
puts "Part 2: #{g.p2}"
