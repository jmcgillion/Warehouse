# Question 1
#numbers = [1, 2, 2, 3]
#numbers.uniq
#puts numbers

The solution will be: [1,2,2,3]

# Question 3 (Replace "important" with "urgent")

advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub("important", "urgent")

# Question 4
numbers = [1, 2, 3, 4, 5]


numbers.delete_at(1)

2
numbers.delete(1)

1

# Question 5: Programmatically determine if 42 lies between 10 and 100.

for i in (10 .. 100)
	i
	puts "The number #{i} is between 10 and 100!"
end

# Question 6  Starting with the string:
famous_words = "and seven years ago..."
show two different ways to put the expected "Four score and " in front of it.

"Four score ".concat(famous_words)
"Four score + #{famous_words}"















