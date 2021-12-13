require "./sheet"

p1 = Sheet.new(File.read("input.txt").chomp)
p1.fold(1)

puts "Part 1: #{p1.visible_points}"

p2 = Sheet.new(File.read("input.txt").chomp)
p2.fold(nil)

puts "Part 2:"

puts p2.debug
