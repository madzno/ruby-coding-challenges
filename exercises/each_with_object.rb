=begin
- takes two arguments; a collection and an empty collection
- it yields each element in the collection and the empty collection
to the block
- returns the empty collection now with elements
- needs to work when empty object is a hash or an array

Examples

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
result == [1, 9, 25]

passes 1 and [] to the block
1 gets added to []
passes 3 and [1] to the block
9 getts added to [1]
passes 5 and [1, 9] to the block
25 gets added to the block
[1, 9, 25] is returned


result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
result == { 1 => 1, 3 => 9, 5 => 25 }
passes

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
result == {}

Algorithm
define a method each with object that takes two arguments an array and collection
iterate through the array
on each iteration pass the element and the collection to the block
stop iterating
return the collection
=end

def each_with_object(arr, coll)
  arr.each { |el| yield(el, coll) }
  coll
end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end

p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end

p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end

p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end

p result == {}
