=begin

get sequences

[1, 3, 6, 10]
[1, 3]
[idx 0, idx1]
[3, 6]
[idx 1, idx 2]
[6, 10]
[idx 2, idx 3]

initialize a local variable starting index to 0 and ending index to 1
pass the element at (arr[starting_index], arr[ending_index]) to the block
add 1 to the starting index and 1 to the ending index
stop iterating when ending index is equal to or greater than the array length minus 1
return nil
=end


def each_cons(arr)
  starting_index = 0
  ending_index = 1
  while ending_index <= arr.length - 1
    yield(arr[starting_index], arr[ending_index])
    starting_index += 1
    ending_index += 1
  end
end

# def each_cons(arr)
#   starting_index = 0
#   ending_index = 1
#   loop do
#     break if ending_index > arr.length - 1
#     yield(arr[starting_index], arr[ending_index])
#     starting_index += 1
#     ending_index += 1
#   end
# end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil
