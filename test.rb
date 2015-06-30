Made a deck as well as dealt 2 hands.
Have calculated the total of each hand as well as shown what they are to user.

first off, if blackjack end the game.  Otherwise, if stays end of loop.  if he hits, its time to get to business and play the game, play out the loop ....

Then, he will either have won via blackjack, stayed, or hit till he busted....

If he got blackjack -- hew won , game over ..
If he had busted -- he lost, game over ..

Or he still has a hand and we have to see how the dealer does ....

dealer_new_card = deck.pop
puts "The dealer has gotten a #{dealer_new_card}?"
dealer_cards << dealer_new_card
dealer_total = calculate_total(dealer_cards)
 if < 17




if player_total == 21
	puts "you have black jack"
	exit
end

next, if total is less than 21 (it has to be -- do something more than once so a while loop ....)

while player_total < 21

	puts "What would you like to do? (1) to hit or (2) to stay?"
	hit_or_stay = gets.chomp_to_i

if ![1, 2].include?(hit_or_stay)
	puts "Error: You must select (1) or (2)"
	next
end

if hit_or_stay == 2
	puts "You have chosen to stay."
	break
end

new_card = deck.pop
player_cards << new_card
player_total = calculate_total(player_cards)
puts "You got a #{{new_card}}, for a total of #{player_total}"

if player_total == 21
	puts "You have blackjack."
	break

	elsif player_total > 21
		puts "Sorry.  you lost."

end
end

what kind of loops are there?

there's

1. loop do
2. until loops
     a.   begin
     	    end until 
     b. until condition
   end
3. while some condition....
     	
    











