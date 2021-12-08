require "./report"

puts "Part 1: #{Report.new(File.read("input.txt").chomp).p1}"
puts "Part 2: #{Report.new(File.read("input.txt").chomp).p2}"
