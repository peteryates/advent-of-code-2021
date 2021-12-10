require "./parser"

puts "Part 1: #{Parser.new(File.read("input.txt").chomp).p1}"
puts "Part 2: #{Parser.new(File.read("input.txt").chomp).p2}"
