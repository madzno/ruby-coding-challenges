=begin
Problem
Input = an array
Output = a boolean

Rules
- processes each element in the collection by passing it to a block
- if the block returns a truthy value, any returns true and STOPS ITERATING
- otherwise any returns false

Examples
- returns false for an empty array

=end

def any?(arr)
  arr.each { |el| return true if yield(el) }
  false
end



p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false
