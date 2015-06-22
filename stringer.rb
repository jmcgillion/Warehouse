statement = "The Flinstones Rock"

letters = (A..Z).to_a + (a..z).to_a

result = {}

letters.each do |letter|
	letter_frequency = statement.scan(letter).count
	result[letter] = letter_frequency if letter_frequency > 0 
end

puts result

























 







