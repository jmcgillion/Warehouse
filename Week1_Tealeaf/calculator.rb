puts "Please enter Numero Uno?"

num1 = gets.chomp

puts "Please enter #2?"

num2 = gets.chomp

puts "Please enter: (1) to add, (2) to subtract, (3) to multiply and (4) to divide."

method = gets.chomp.to_i

if method == 1
  puts num1.to_i + num2.to_i
elsif method == 2
	puts num1.to_i - num2.to_i
elsif method == 3
	puts num1.to_i * num2.to_i
elsif method == 4
	puts num1.to_f / num2.to_i
end
















