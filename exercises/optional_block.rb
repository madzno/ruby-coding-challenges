# def compute
#   if block_given?
#     yield
#   else
#     "Does not compute."
#   end
# end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

def compute(str)
  raise TypeError unless str.class == String
  return "Does not compute." unless block_given?
  yield(str)
end

p compute('hello') { |str| str + 'hi' } == 'hellohi'
p compute('hello') { |str| str.upcase } == 'HELLO'
p compute('hello') == "Does not compute."
p compute(2) #TypeError
