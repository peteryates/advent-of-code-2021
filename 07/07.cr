require "./target_finder"

puts "Part 1: #{TargetFinder.new(File.read("input.txt")).calculate}"
puts "Part 2: #{TargetFinder.new(File.read("input.txt")).crabculate}"
