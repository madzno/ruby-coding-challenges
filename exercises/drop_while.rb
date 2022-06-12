=begin
Problem
Input: An array
Output: An Array

- iterates over a collection
- passes each ellement in the collection to a block
- as soon as an element returns a falsey value from the block, it adds that
element and then all the remaining elements in the input aray to a new array
- if all the elements return a truthy value, an empty array is returned
- if drop while is passed an empty array it returns an empty array

Examples
drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
- 6 is the first element that returns a falsey value so an array
with just 6 is returned since there are no elements after 6


drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
- 1 is the first element that returns a falsey value
so an array with all of the elements is returned

drop_while([1, 3, 5, 6]) { |value| true } == []
- all elements return a truthy value so an empty array is returned


drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
- 1 ist he first element that returns a falsey value son an array
with all of the elements is returned

drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
- 5 is the first element that returns a fallsey value so
an array with 5 and 6 is returned

drop_while([]) { |value| true } == []
- an empty array is passed as an argument so an empty array is returned


Algo
- define a method drop_while that takes an array argument
- initialize a local variable index to nil
- iterate through the input array if an element returns a falsey value, re assign the index
local variable to that elements index and break out of the iteration
- if index is nil return an empty array
- if index is a number
- add each element in the calling array to the result array starting at index
- stop iterating when index is greater than the array length
- return the results array
=end

def find_falsey_index(array, &block)
  index = nil

  array.each do |el|
    if !yield(el)
      index = array.find_index(el)
      break
    end
  end

  index
end

def drop_while(array, &block)
  index = find_falsey_index(array, &block)
  result_arr = []

  return result_arr if index.nil?

  array.each_with_index do |el, idx|
    result_arr << el if idx >= index
  end

  result_arr
end


p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
