require "./cave_system.cr"

puts "Part 1: #{CaveSystem.new(File.read("input.txt").chomp).p1}"
puts "Part 2: #{CaveSystem.new(File.read("input.txt").chomp).p2}"
