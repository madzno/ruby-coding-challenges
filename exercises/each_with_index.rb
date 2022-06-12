=begin

Problem
- each with index iterates over the members of the collection
- passes each element and its index to a block
- return value of block not used
- returns original collection
=end



def each_with_index(arr)
  index = 0

  loop do
    yield(arr[index], index)
    index += 1
    break if index >= arr.length
  end

  arr
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
