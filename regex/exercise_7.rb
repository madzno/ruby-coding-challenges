
def format_date(date)
  if date.match?(/\d\d\d\d-\d\d-\d\d/)
    date.sub(/(\d\d\d\d)-(\d\d)-(\d\d)/, '\3.\2.\1')
  elsif date.match?(/\d\d\d\d\/\d\d\/\d\d/)
    date.sub(/(\d\d\d\d)\/(\d\d)\/(\d\d)/, '\3.\2.\1')
  else
    date
  end
end

p format_date('2016-06-17') == '17.06.2016'
p format_date('2017/05/03') == '03.05.2017'
p format_date('2015/01-31') == '2015/01-31'
