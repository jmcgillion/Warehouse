CHOICES = {'r' => "rock", 'p' => "papers", 's' => "scissors"}
puts "Let's play rock, papers scissors."

loop do 

  begin
	"Please choose (r) for rock, (p) for papers and (s) for scissors."
	player_play = gets.chomp.downcase
  end until CHOICES.include?(player_play)

  computer_play = CHOICES.values.sample

  









	


if player_play == "rock"
	if computer_play == "rock"
		say "The game is a tie.  We will have to play again."
	elsif computer_play == "papers"
		say "The winner is The computer.  Let's have a hand for the computer !"
	elsif computer_play == "scissors"
		say "The BiG Winner is YOU !!! Way to go, #{name} !!! "
	end
elsif player_play == "papers"
	if computer_play == "rock"
		say ""
	elsif computer_play == "papers"
		say "The game is a tie.  We will have to play again."
	elsif computer_play == "scissors"
		say "The BiG Winner is YOU !!! Way to go, #{name} !!! "
	end
elsif player_play == "scissors"
	if computer_play == "rock"
		say "The winner is The computer.  Let's have a hand for the computer !"
	elsif computer_play == "papers"
		say "The BiG Winner is YOU !!! Way to go, #{name} !!! "
	elsif computer_play == "scissors"
		say "The game is a tie.  We will have to play again."
	end
end





