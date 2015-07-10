class Hand
	include Comparable

	attr_reader :value

	def initialize(v)
		@value = v
	end

	def <=>(another_hand)
		if @value == another_hand.value
			0
		elsif (@value == 'p' && another_hand.value == 'r') || (@value == 'r' && another_hand_value == 's') || (@value == 's' && another_hand_value == 'p')
			1
		else
			-1
		end
	end

	def display_winning_message
		case @value
		when 'p'
			puts "Papers smothers the rock!"
		when 'r'
			puts "The rock always rocks the scissors!"
		when 's'
			puts "Scissors slices the papers!"
		end
	end

	class Player
		attr_accessor :hand
		attr_reader  :name

		def initialize(n)
			@name = n
		end

		def to_s
			"#{name} presently has a choice of #{self.hand.value}!"
		end
	end

	class Human < Player
		def pick_hand
			begin
				puts "Pick one: (p,r,s):"

