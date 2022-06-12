=begin

Problem
input = starting value, ending value, and "step value"
loops through collection from starting value to end value each time adding the step value to the current value
returns the original  range (but ours doesnt take a range hm)


Data structure - range or array

Algo
- define a method step that takes three integer arguments - a starting value, ending value and step value
- initialize a counter variable to the starting integer
- initialze a loop
- pass the first value to the implicit block
- add the step value to the counter variable
- break if the counter variable is greater than the ending value
- return a range (starting value..ending value)
=end

def step(starting, ending, step)
  counter = starting
  loop do
    yield(counter)
    counter += step
    break if counter > ending
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }
