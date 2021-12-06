require "./fish_counter"

puts "Part 1: #{FishCounter.new(File.read("input.txt")).iterate(80).count}"
puts "Part 2: #{FishCounter.new(File.read("input.txt")).iterate(256).count}"
