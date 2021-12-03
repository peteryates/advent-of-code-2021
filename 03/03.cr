########
# prep #
########

diagnostics = File
  .read_lines("input.txt")
  .map { |l| l.chomp.chars.map { |c| c.to_i } }

width = diagnostics[0].size - 1

def values_at(numbers, pos, high : Int32 = 1, low : Int32 = 0)
  v = numbers.map { |n| n[pos] }
  v.count(1) >= v.count(0) ? high : low
end

def convert(bits) : Int32
  bits.join.to_i(base: 2)
end

def find(numbers, high : Int32 = 1, low : Int32 = 0)
  i = 0

  while numbers.size > 1
    target = values_at(numbers, i, high: high, low: low)
    numbers.select! { |n| n[i] == target }
    i += 1
  end

  return numbers[0]
end

##########
# part 1 #
##########

epsilon = convert((0..width).map { |i| values_at(diagnostics, i) })
gamma = convert((0..width).map { |i| values_at(diagnostics, i, high: 0, low: 1) })

puts "Part 1: #{epsilon * gamma}"

##########
# part 2 #
##########

o2_generator = convert(find(diagnostics.dup))
co2_scrubber = convert(find(diagnostics.dup, high: 0, low: 1))

puts "Part 2: #{o2_generator * co2_scrubber}"
