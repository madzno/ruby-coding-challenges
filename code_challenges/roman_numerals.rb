=begin
Class
RomanNumeral

Methods
Constructor
- Takes one argument
- assigns argument to an instance variable @value

Instance method 'to_roman'
INPUT: An Integer (the integer assigned to @value)
OUTPUT: A String (the integers representation in Roman Numerals)

What Are the Roman Numerals?
1 => I
5 => V
10 => X
50 => L
100 => C
500 => D
1,000 => M

Rules
- Roman numerals are written by expressing each digit seperately starting with the left most digit and skipping any digit with the value of 0
- Depending on the order, a roman numeral may indicate to subtract vs to add
 - IX = 9
 - XI = 11
- Skipping 0?
  - CDII = 402 ( 500 - 100 = 400, 'skips 0', 2 = II )
  - MCMXC = 1900 (1000 = M, CM = 900, 90 = XC )
- No numbers > 3000

Test Cases

I = 1

II = 2

III = 3

IV = 4

V = 5

VI = 6

IX = 9

XX = 2, VII = 7 = 27

XL = 4, VIII = 8 = 48

For Digits 1-9
1 - 3 I, II, III
4 IX
5 V
6 - 8 VI, VII, VIII
9 - IX
- Rule: If the integer ends in any of these digits, these are the roman numerals to use

For Digits 10, 20, 30, 40, 50, 60, 70, 80, 90
10 X
20 XX
30 XXX
40 XL
50 L
60 LX
70 LXX
80 LXXX
90 XC

For Digits 100, 200, 300, 400, 500, 600, 700, 800, 900
100 C
200 CC
300 CCC
400 CD
500 D
600 DC
700 DCC
800 DCCC
900 XM

For Digits 1000, 2000, 3000
1000 M
2000 MM
3000 MMM

Data structure/test cases

Store ones, tens, hundreds in a hash
For thousands just multiply the place # by 'M'

Algorithm

Define a method to_roman that takes an integer as input
Split the integer into an array of digits (gives digits reversed) and then reverse that array
Initialize an empty string roman_numarls

If the length of the digits array is 1,
  assign the string roman_numerals to ONES[digits_array[0]]
If the length of the digits array is 2,
  assign the string roman_numerals to TENS[digits_array[0]] + ONES[digits_array[1]]
If the length of the digits array is 3,
  assign the string roman_numerals to HUNDREDS[digits_array[0]] + TENS[digits_array[1]] + ONES[digits_array[2]]
If the length of the digits array is 4,
  assign the string roman_numerals to (digits_array[0] * 'M') + HUNDREDS[digits_array[1]] + TENS[digits_array[2]] + ONES[digits_array[3]]
end

return the string roman_numerals
=end

ONES = { 0 => '',
         1 => 'I',
         2 => 'II',
         3 => 'III',
         4 => 'IV',
         5 => 'V',
         6 => 'VI',
         7 => 'VII',
         8 => 'VIII',
         9 => 'IX' }

TENS = { 0 => '',
         1 => 'X',
         2 => 'XX',
         3 => 'XXX',
         4 => 'XL',
         5 => 'L',
         6 => 'LX',
         7 => 'LXX',
         8 => 'LXXX',
         9 => 'XC' }

HUNDREDS = { 0 => '',
             1 => 'C',
             2 => 'CC',
             3 => 'CCC',
             4 => 'CD',
             5 => 'D',
             6 => 'DC',
             7 => 'DCC',
             8 => 'DCCC',
             9 => 'CM' }

class RomanNumeral
  def initialize(num)
    @value = num
  end

  def to_roman
    digits_arr = @value.digits.reverse
    roman_numeral = ''

    case digits_arr.length
    when 1 then roman_numeral = ONES[digits_arr[0]]
    when 2 then roman_numeral = TENS[digits_arr[0]] + ONES[digits_arr[1]]
    when 3 then roman_numeral = HUNDREDS[digits_arr[0]] + TENS[digits_arr[1]] +
                                ONES[digits_arr[2]]
    when 4 then roman_numeral = ('M' * digits_arr[0]) + HUNDREDS[digits_arr[1]] +
                                TENS[digits_arr[2]] + ONES[digits_arr[3]]
    end

   roman_numeral
  end
end
