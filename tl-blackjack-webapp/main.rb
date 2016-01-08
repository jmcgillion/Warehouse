require 'sinatra'
require 'rubygems'

set :sessions, true

BLACKJACK_AMOUNT = 21
DEALER_MIN_HIT = 17
INITIAL_POT_AMOUNT = 500

helpers do 
	def calculate_total(cards)
	  arr = cards.map {|e| e[1]}

	  total = 0
		arr.each do |card|
      if card == 'A'
				total += 11
		  elsif card.to_i != 0
				total += card.to_i
		  else
				total += 10
		  end
		end
	
		if total > 21
    arr.select {|card| card == "A"}.count.times do |total|
      break if total <= BLACKJACK_AMOUNT
      total -= 10
    end

    total
	end

	def card_image(card)
		suit = case card[0]
			when 'H' then 'hearts'
			when 'D' then 'diamonds'
			when 'C' then 'clubs'
			when 'S' then 'spades'
		end

		value = card[1]
			if ['J', 'Q', 'K', 'A'].include?(value)
		value = case card[1]
					when 'J' then 'jack'
					when 'Q' then 'queen'
					when 'K' then 'king'
					when 'A' then 'ace'
			end
		end
		
		"<img src='/images/cards/#{suit}_#{value}.jpg' class='card_image'>"
	end

	def winner!(msg)
		@play_again = true
		@show_or_hit_buttons = false
		session[:player_pot] = session[:player_pot] + session[:player_bet]
		@winner = "<strong>#{session[:player_name]} wins!</strong>#{msg}"
	end

	def loser!(msg)
		@play_again = true
		@show_or_hit_buttons = false
		session[:player_pot] = session[:player_pot] - session[:player_bet]
		@loser ="<strong>#{session[:player_name]} loses.  You'll have to perhaps give it another go ...</strong>#{msg}"
	end

	def tie!(msg)
		@play_again = true
		@show_hit_or_stay_buttons = false
		@winner ="<strong>It's a Tie!</strong>#{msg}"
	end

end

before do
	@show_hit_or_stay_buttons = true
end

get '/' do
	if session[:player_name]
		redirect '/game'
	else
		redirect '/new_player'
	end
end

get '/new_player' do
	session[:player_pot] = INITIAL_POT_AMOUNT
	erb :new_player
end

post '/new_player' do
  if params[:player_name].empty?
  	@error = "Sorry but your epithet is mandatory."
  	halt erb (:new_player)
  end
  
  	session[:player_name] = params[:player_name]
  	redirect '/bet'
 end

get '/bet' do
	session[:player_bet] = nil
	erb :bet
end

post '/bet' do
	if params[:bet_amount].nil? || params[:bet_amount].to_i == 0
		@error = "It's time to lay something down on the line pal.  It doesn't have to be everything but it's got to be something."
		halt erb(:bet)
	elsif params[:bet_amount].to_i > session[:player_pot]
		@error = "You don't have that bro. You have ($#{session[:player_pot]}). You'll have to try again."
	else
		session[:player_bet] = params[:bet_amount].to_i
		redirect '/game'
	end
end

get '/game' do
	session[:turn] = session[:player_name]

	suit = ['H', 'D', 'S', 'C']
	value = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
	session[:deck] = suit.product(value)

	session[:dealer_cards] = []
	session[:player_cards] = []

	session[:dealer_cards] << session[:deck].pop
	session[:player_cards] << session[:deck].pop
	session[:dealer_cards] << session[:deck].pop
	session[:player_cards] << session[:deck].pop

	erb :game

end

post 'game/player/hit' do
  session[:player_cards] << session[:deck].pop

  player_total = calculate_total(session[:player_cards])
	if player_total == BLACKJACK_AMOUNT
  	winner!("#{session[:player_name]} Congrats!  That's better than black. You've hit Blackjack!")
  elsif player_total > BLACKJACK_AMOUNT
  	loser!("Looks like you've gone bust with a total of #{session[:player_total]}.  Please try your luck next time.")
  end

  erb :game, layout: false
end

post '/game/player/stay' do
	@success = "#{session[:player_name]} has chosen to take a siesta."
	@show_hit_or_stay_buttons = false
	redirect '/game/dealer'
end

get '/game/dealer' do
	session[:turn] = 'dealer'
	@show_hit_or_stay_buttons = false

	dealer_total = calculate_total(session[:dealer_cards])

	if dealer_total == BLACKJACK_AMOUNT
		loser!("The BJ Dealer has been 'wheelin and dealin'. Luck is the residue of Good Design. Try again.")
	elsif dealer_total > BLACKJACK_AMOUNT
		winner!("Looks like a rose.  The dealer has busted.  #{session[:player_name]} has won !!!}")
	elsif dealer_total >= DEALER_MIN_HIT
		redirect '/game/compare'
	else
		@show_dealer_hit_button = true
	end

	erb :game, layout: false
end

post '/game/dealer/hit' do
	session[:dealer_cards] << session[:deck].pop
	redirect '/game/dealer'
end

get '/game/compare' do
	@show_hit_or_stay_buttons = false

	player_total = calculate_total(session[:player_cards])
	dealer_total = calculate_total(session[:dealer_cards])

	if player_total > dealer_total
		winner!("Let's pop some champage, #{player_name}.  You've won with a total of #{player_total}.")
	elsif dealer_total > player_total
		loser!("We are sorry but the dealer's #{dealer_total} beats your #{player_total}.")
	else
		tie!("Both yourself #{player_name} and the dealer stayed on the island of #{player_total}.")
	end

	erb :game, layout: false
end

get '/game_over' do
	erb :game_over
end

end
















	




















