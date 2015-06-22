title = "Ruby on rails"

words = title.split

words.map! do |word|
	word.capitalize
end

puts words.join(" ")









