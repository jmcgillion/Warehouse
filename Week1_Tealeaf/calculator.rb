def say(message)
	puts "#{message}"
end

say "Please enter Numero Uno?"

num1 = gets.chomp

say "The first number that has been chosen is #{num1}"

say "Please enter #2?"

num2 = gets.chomp

say "The second # that has been chosen is #{num2}."

say "Please enter: (1) to add, (2) to subtract, (3) to multiply and (4) to divide."

method = gets.chomp.to_i

if method == 1
	say "OK.  So, we will be adding ... "
	result = num1.to_i + num2.to_i
elsif method == 2
	say "OK.  So, we will be subtracting ... "
	result = num1.to_i - num2.to_i
elsif method == 3
	say "OK.  So, we will be multiplying ... "
	result = num1.to_i * num2.to_i
elsif method == 4
	say "OK.  So, we will be dividing ... "
	result = num1.to_f / num2.to_f
end

say "The result is #{result}"






















