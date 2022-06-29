=begin
Input - a string
Output - an array of strings

Whitespaces OR commas deliminate the text
Whitespace?
\t, " ", ,
\t
" ", " "
,

Examples
"Pete,201,Student"
['Pete', '201', 'Student']
split by commas ,

"Pete \t 201    , TA"
["Pete", "201", "TA"]
split by \t, and ,

"Pete \t 201"
split by \t
["Pete", "201"]

"Pete \n 201"
["Pete", "\n", "201"]
Split by 2 single spaces

=end

def fields(string)
  string.split(/[ \t,]+/)
end


p fields("Pete,201,Student") == ["Pete", "201", "Student"]
p fields("Pete \t 201    ,  TA") == ["Pete", "201", "TA"]
p fields("Pete \t 201") == ["Pete", "201"]
p fields("Pete \n 201") == ["Pete", "\n", "201"]
