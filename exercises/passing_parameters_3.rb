items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# gather(items) do |*produce, grain|
#   puts produce.join(', ')
#   puts grain
# end

# gather(items) do |fruit, *vegetables, grain|
#   puts fruit
#   puts vegetables.join(', ')
#   puts grain
# end

# gather(items) do |fruit, *other|
#   puts fruit
#   puts other.join(', ')
# end

gather(items) do |fruit, corn, vegetable, grain|
 puts "#{fruit}, #{corn}, #{vegetable}, and #{grain}"
end
