require 'pry'
class BoardEvaluator
  MARKERS = %w[X O]
  INITIAL_BOARD = %w[0 1 2 3 4 5 6 7 8]

  attr_accessor :board, :current_player

  def initialize
    @board = INITIAL_BOARD
    @current_player = 0
  end

  def game_is_over?
    [board[0], board[1], board[2]].uniq.length == 1 ||
        [board[3], board[4], board[5]].uniq.length == 1 ||
        [board[6], board[7], board[8]].uniq.length == 1 ||
        [board[0], board[3], board[6]].uniq.length == 1 ||
        [board[1], board[4], board[7]].uniq.length == 1 ||
        [board[2], board[5], board[8]].uniq.length == 1 ||
        [board[0], board[4], board[8]].uniq.length == 1 ||
        [board[2], board[4], board[6]].uniq.length == 1 ||
        tie?
  end

  def tie?
    board.all? { |s| s == "X" || s == "O" }
  end

  def apply_move(move)
    board[move] = MARKERS[current_player]
    @current_player = current_player == 0 ? 1 : 0
  end

  def possible_moves
    board.select{ |value| !MARKERS.include? value }
  end

  def valid_move?(move)
    unless possible_moves.include?(move)
      puts "Must be one of these positions #{possible_moves.join(", ")}."
      return false
    end
    true
  end
end