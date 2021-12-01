measurements = File.read_lines("input.txt").map { |l| l.chomp.to_i }

##########
# part 1 #
##########

# build an array where true represents increase, then count the trues
p1 = measurements
  .map_with_index { |m, i| m > measurements[i-1] }
  .count(true)

##########
# part 2 #
##########

# map each window into an array, get rid of any with fewer than
# 3 entries and sum them
slices = (0..measurements.size)
  .map    { |i| measurements[i..i+2] }
  .reject { |s| s.size < 3 }
  .map    { |s| s.sum }

# use the same approach as in part 1 but this time on our
# slices instead of the raw input measurements
p2 = slices
  .map_with_index { |s, i| s > slices[i-1] }
  .count(true)

###########
# outputs #
###########

puts "Part 1: #{p1}"
puts "Part 2: #{p2}"
