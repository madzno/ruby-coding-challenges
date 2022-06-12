=begin

input: an array
output: the element with the largest value

- iterates over the array
- passes each element to the block
- returns the element for which the block returned the largest value

Algo
- define a method max by that takes an array as an argument and an implicit block
- if the array is empty return nil
- initialize a local variable current_return_value to the return value of the first element in the array
- initialze a local variable max_element to the first element in the array
- iterate over the array starting at index 1
-  IF the element's return value is greater than the current_return value
  -reassign current_return_value to the return value of the element at the current index AND
  -reassign max_element to the current element
- iterate until the last index
- return the max_element
=end

def max_by(arr)
  return nil if arr.empty?

  max_element = arr.first
  max_return_value = yield(max_element)

  arr.each do |el|
    return_value = yield(el)
    if return_value > max_return_value
      max_return_value = return_value
      max_element = el
    end
  end

  max_element
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
