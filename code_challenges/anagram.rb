=begin

Classes
- Anagram class

Methods
- Constructor
  - takes one argument, a string and assigns that to @word
- Match

Match method PEDAC

Input; An Array of Strings
Output; An empty array or array of strings of the input array that are anagrams of @word

Clarifying questions
What is an anagram?
An anagram is a word that contains **ALL** of the same characters as the input string (i.e all the characters in a certain word must be present in @word)

Rules
- output can be an empty array if none of the input array strings are anagrams of @word
- counts of all the
- same exact word is NOT an anagram - 'CORN' is NOT an anagram of 'corn'
- In order for a string to be considered an anagram, it must be THE SAME length of the @word string
- anagrams are case INSENSITIVE


Examples

@word = 'ant'
arr = ['tan', 'stand', 'at']
result_arr = ['tan']

'tan' is the only word in arr that is an anagram of 'ant'

@word = galea
arr = ['eagle']
result_arr = []


@word = 'diaper'
arr = ['hello', 'world', 'zombies', 'pants']
result_arr = []

NONE of the strings in 'arr' are anagrams of diaper

@word = 'corn'
arr = ['corn', 'dark', 'Corn', 'rank', 'CORN', 'cron', 'park']
result_arr = ['cron']

Same exact word is NOT considered an anagram

@word = 'good'
arr = ['dog', 'goody']
result_arr = []

Even though all the characters of `dog` are also in 'good', 'dog' and 'good' are not the same length and therefore
are not anagrams (substrings are not anagrams)

@word = Orchestra
arr = ['cashregister', 'Carthourse', 'radishes']
result_arr = ['Carthourse']

Anagrams are case INSENSITIVE

ALGO

- Method named 'match' takes one argument 'string_arr'
- initialize an empty array variable 'anagrams'
- Rule # 1 = Anagrams are case insensitive.
  - initialize a local variable chars_to_compare to @word downcased and split into chars
  - downcase all the strings in the input array (transform them to their downcase versions)
- Rule # 1 = In order for a word to be considered an anagram, all of its characters must be included in the input string
  - Iterate through the input array, for each string split the string into its characters and assign the return value of this to chars_array
  - iterate through the chars array if all the characters in the chars array are in chars_to_compare array, add that string
    to the anagrams array
- Rule #2 = the count of each character in the input string must be the same as the count of that character in the
  - iterate through chars_to_compare
  - also iterate through the anagrams array
  - if the count of the current character in chars_to_compare is the same in the word_to_compare and the current string in anagram, add that anagram
    to results
- Rule # 4 - anagrams cannot be the same exact word
- Rule # 5 - anagrams cannot be substrings (need to be the same length as the input string)
- iterate through the the anagrams array and select those strings;
 - that when downcased are NOT equal to @word
 - that are the same length as @word

=end

class Anagram
  attr_reader :word

  def initialize(string)
    @word = string
  end

  def match(arr)
    word_to_compare = word.downcase
    chars_to_compare = word.downcase.chars
    anagrams = []

    arr.each do |string|
      if string.chars.all? { |char| chars_to_compare.include?(char.downcase) }
        anagrams << string
      end
    end

    chars_to_compare.each do |char|
      anagrams.select! do |string|
        word_to_compare.count(char) == string.downcase.count(char)
      end
    end

    anagrams.select do |string|
      string.downcase != word_to_compare && string.length == word_to_compare.length
    end
  end
end


