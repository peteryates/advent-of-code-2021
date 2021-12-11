require "./grid"

puts "Part 1 #{Grid.new(File.read("input.txt").chomp).p1}"
puts "Part 2 #{Grid.new(File.read("input.txt").chomp).p2}"
