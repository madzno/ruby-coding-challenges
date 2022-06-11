=begin
Processes elements in a collection by passing each element value to a block that is provided in method calls

If the block returns a truthy value for exactly one element one? returns true otherwise it returns false
Method should stop processing elements of the array as soon as block returns true a second time
=end

def one?(arr)
  count = 0
  arr.each do |el|
    if count > 1
      return false
    elsif yield(el)
      count += 1
    end
  end
  if count == 1
    return true
  else
    return false
  end
end

p one?([1, 3, 5, 6]) { |value| value.even? } == true
p one?([1, 3, 5, 7]) { |value| value.odd? } == false
p one?([2, 4, 6, 8]) { |value| value.even? } == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true } == false
p one?([1, 3, 5, 7]) { |value| false } == false
p one?([]) { |value| true } == false
