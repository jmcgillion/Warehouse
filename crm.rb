suits = ["H", "D", "C", "S" ]

pips  = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"]

deck = suits.product(pips)
deck.shuffle!

player_cards = []
computer_cards = []

player_cards << deck.pop
computer_cards << deck.pop
player_cards << deck.pop
computer_cards << deck.pop

def calculate_total(cards)
	arr = cards.map do |e|
		e[1]
	end

	total = 0

  arr.each do |card|
  	if card == "A"
  		total += 11
  	elsif card.to_i == 0
  		total += 10
  	elsif
  		total += card.to_i
  	end
  end

  if total > 21
  	arr.select {|card| card == "A"}.count.times do |total|
  		total - 10
  	end
  end

  	total

 end

player_total = calculate_total(player_cards)
computer_total = calculate_total(computer_cards)

puts "Welcome to the game of blackjack.  The dealer has dealt the first 2 cards.  Let's see what we have ...."
puts "Player's cards: #{player_cards[0]} + #{player_cards[1]}, for a total of #{player_total}."
puts "The dealer is showing: #{computer_cards[0]} + #{computer_cards[1]}, for a total of #{computer_total}."

if player_total == 21 && computer_total == 21
	puts "The player has blackjack.  And the dealer also has blackjack.  It is a tie."
	exit
elsif player_total == 21
	puts "You have blackjack.  Way to go.  You Win!"
	exit
elsif computer_total == 21
	puts "The dealer is showing blackjack.  Sorry, you lose."
	exit
end

while player_total < 21

puts "What would you like to do?  (1) to hit.  (2) to stay?"
hit_or_stay = gets.chomp
if !["1", "2"].include?(hit_or_stay)
	puts "Error: You need to enter (1) to hit.  (2) to stay."
	next
end

if hit_or_stay == "2"
	puts "You have decided to stay at #{player_total}."
	break
end

new_player_card = deck.pop
player_cards << new_player_card
player_total = calculate_total(player_cards)
puts "You are showing a #{new_player_card}, for a total of #{player_total}."

if player_total == 21
	puts "You have blackjack.  You win!"
	exit
end
if player_total > 21
 puts "Sorry, you have gone bust.  You lose."
 exit
end

end

while computer_total < 17

new_computer_card = deck.pop
computer_cards << new_computer_card
computer_total =  calculate_total(computer_cards)
puts "The dealer has been dealt a card #{new_computer_card}, for a total of #{computer_total}."

end



if computer_total > 21
	puts "The dealer has gone bust.  You win!!"
	
elsif player_total > computer_total
	puts "You have a #{player_total}.  The dealer has #{computer_total}.  You win."
elsif computer_total > player_total
	puts "You have a #{player_total}.  The dealer is showing a #{computer_total}.  Sorry, you lose."
elsif computer_total == player_total
	puts "You have #{player_total}.  The dealer has #{computer_total}.  It's a tie."
end
















