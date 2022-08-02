birds = ['raven', 'finch', 'hawk', 'eagle']

def groups(arr)
  yield(arr)
end

groups(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
end


