# 1. Requirements/Specs to ascertain scope
# 2. Application Logic: Sequence of Steps
# 3. Ruby Translation
# 4. Rubber Duck Debugging

# We greet the user and ask him what he would like to do as far as calculating.  Then we ask him for the 2 numbers.
# Then, we ask him if he'd like to exit or had something else to calculate ...

begin

	puts "Hello, welcome to Mr. Calculator.  It is certainly nice to meet you.  May I have your name?"

	name = gets.chomp

	puts "Great #{name}.  It is time to do some serious calculating.  Please choose (1) to add, (2) to subtract, (3) to multiply, and (4) to divide."

	answer = gets.chomp.to_i

	puts "Please provide the first number?"
	first_number = gets.chomp
	puts "Please enter the second number?"
	second_number = gets.chomp

	if answer == 1
		total = first_number.to_i + second_number.to_i
	elsif answer == 2
		total = first_number.to_i - second_number.to_i
	elsif answer == 3
		total = first_number.to_i * second_number.to_i
	elsif answer == 4
		total = first_number.to_f / second_number.to_f
	end

	puts "The total is #{total}."

	puts "Would you like to calculate again? (y) for yes and (n) for no?"
	response = gets.chomp.downcase

end until response == "n"



		



