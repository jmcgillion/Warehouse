CHOICES = {'r' => "rock", 'p' => "papers", 's' => "scissors"}

def declare_winner(winning_choice)
	if winning_choice == 'r'
		puts "The rock shatters the scissors!"
	elsif winning_choice == 's'
		puts "The scissor always slices the paper."
	elsif winning_choice == 'p'
		puts "The papers rolls all over the rock."
  end
end





loop do

begin
	puts "Welcome to rock, papers and scissors!  Let's get started with our game."
	puts "Please select: (r) for rock, (p) for papers, or (s) for scissors?"
	player_move = gets.chomp.downcase
end until CHOICES.keys.include?(player_move)

puts "You have selected #{CHOICES[player_move]}."
computer_move = CHOICES.keys.sample
puts "The computer has selected #{CHOICES[computer_move]}."


if player_move == computer_move
	puts "It's a tie."

elsif(player_move == "r" && computer_move == "s") ||(player_move == "s" && computer_move == "p") || (player_move == "p" && computer_move == "r")
  puts "You win!"
  declare_winner(player_move)

else
	declare_winner(computer_move)
	puts "The computer wins!"
end
  
puts "Would you like to play again?  Yes(y) or No(n)?"
response = gets.chomp.downcase

if response == "n"
 	break
 end
   
end

