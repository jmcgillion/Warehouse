# Tictactoe 
#  1. Requirements/Specs that will determine scope ...
#  2. Application Logic/sequence of steps ...
#  3. Translate in to Ruby ...
#  4. Run the code ...

# {1 => " ", 2 => " ", 3 => " ", 4 => " ", 5 => " ", 6 => " ", 7 => " ", 8 => " ", 9 => " "}


def initiate_board
  board = {}
  (1..9).each do [position]
  board[position] = " "
  board
end

def draw_board(board)
  puts " board[1] | board[2] | board[3] "
  puts " ------------"
  puts " board[4] | board[5] | board[6] "
  puts " ------------"
  puts " board[7] | board[8] | board[9] "
end

def empty_pieces(board)
  board.values.select do|position|
    board[position] = " "
  end
end

def player_makes_move(board)
  begin
  puts "Please select (1) thru (9)?"
  position = gets.chomp.to_i
  end until empty_pieces.include?(position)
  board[position] = "x"
end

def computer_makes_move(board)
  empty_pieces(board).sample
  board[position] = "o"
end

def nine_positions_full(board)
  empty_pieces(board) == [ ]
end

def check_for_winner(board)
  winning_lines = [[1, 2, 3], [4, 5, 6 ], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]] 
  winning_lines.each do |line|
    return "Player" if board.values_at(*line).count("x") == 3
    return "Computer" if board.values_at(*line).count("o") == 3
  end
  nil
end

def declare_winner(winner)
  puts "The #{winner} has won!"
end

puts "Let's play tictactoe"
board = initiate_board
draw_board(board)

begin
  player_makes_move(board)
  draw_board(board)
  computer_makes_move(board)
  draw_board(board)
  winner = check_for_winner(board)
end until winner || nine_positions_full(board)

if winner
  declare_winner(winner)
else
  puts "It is a tie."
end
end


