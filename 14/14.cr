require "./polymer"

puts "Part 1: #{Polymer.new(File.read("input.txt").chomp).steps(10).total}"
puts "Part 1: #{Polymer.new(File.read("input.txt").chomp).steps(40).total}"
