
def initiate_board
	board = {}
  (1..9).each {|position| board[position] = " "}
  board
end


def draw_board(board)
 	system "clear"
 	puts
	puts "#{board[1]} | #{board[2]} | #{board[3]}"
 	puts "----------"
 	puts "#{board[4]} | #{board[5]} | #{board[6]}"
 	puts "----------"
 	puts "#{board[7]} | #{board[8]} | #{board[9]}"
 	puts
 end

def empty_positions(board)
  board.keys.select do|position|
  board[position] = " "
end


def player_makes_move(board)
	begin
	puts "Choose a position (1) thru (9) to make a move:"
	position = gets.chomp.to_i
  end until empty_positions(board).include?(position)
  board[position] = "X"
end

def computer_makes_move(board)
	position = empty_positions(board).sample
	board[position] = "O"
end

def get_winner(board)
	winning_lines = [[1, 2, 3], [1, 4, 7], [4, 5, 6], [7, 8, 9], [2, 5, 8], [3, 6, 9], [7, 8, 9], [3, 5, 7]]
	winning_lines.each do |line|
		return "Player" if board.values_at(*line).count("X") == 3
		return "Computer" if board.values_at(*line).count("O") == 3
	  end
	  nil 
	end

def nine_positions_filled(board)
	empty_positions(board) == []
end

def declare_winner(winner)
	puts "#{winner} has won!"
end



puts "Let's play tictactoe!"
board = initiate_board
draw_board(board)

begin
	player_makes_move(board)
	draw_board(board)
	computer_makes_move(board)
	draw_board(board)
	winner = get_winner(board)
end until winner || nine_positions_filled(board)

if winner
	declare_winner(winner)
else 
	puts "We have a tie."
end


