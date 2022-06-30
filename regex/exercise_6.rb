=begin

split the input string based on the symbol `-`
reverse the order of the array that is split
join the array together
Use gsub to change `-` to `.`
Regular expression `/\-/`?

=end

# def format_date(date)
#   date.split(/\-/).reverse.join('.')
# end

def format_date(date)
  date.sub(/(\d\d\d\d)-(\d\d)-(\d\d)/, '\3.\2.\1')
end
p format_date('2016-06-17') == '17.06.2016'
p format_date('2016/06/17') == '2016/06/17'
