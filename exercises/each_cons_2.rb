=begin
- second argument that specifies how many are processed at each time
- starting index = 0
- ending index = arg - 1

=end

def each_cons(arr, con_length)
  starting_index = 0
  ending_index = con_length - 1

  while ending_index <= arr.length - 1
    yield(arr[starting_index], *arr[(starting_index + 1)..ending_index])
    starting_index += 1
    ending_index += 1
  end

end

=begin

How do I get the values from starting index + 1 to ending index
[1, 3, 6, 10]
want to send 3 and 6 as arguments
answer: splat operator
=end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}

each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end

p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}

each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end

p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}
