=begin
Input = a string
Output = true or false based on if the input looks like a URL

Can use match? method
What is A URL
http(optional s)://text no whitespace and URL begins and ends the string (anchor it)
=end

def url?(string)
  string.match?(/\Ahttps*:\/\/\S+\z/)
end

p url?('http://launchschool.com') == true
p url?('https://example.com') == true
p url?('https://example.com hello') == false
p url?('   https://example.com') == false
