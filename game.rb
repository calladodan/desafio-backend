require_relative 'human'
require_relative 'bot'
require_relative 'display'
require_relative 'board_evaluator'
require 'pry'
class Game

  PLAYER_TYPES = [Human, Bot]
  attr_accessor :board, :display, :player1, :player2, :current_player, :board_evaluator

  def initialize
    @display = Display.new
    @board_evaluator = BoardEvaluator.new
  end

  def start_game(p1, d1, p2, d2)
    @player1 = PLAYER_TYPES[p1.to_i].new(0, board_evaluator)
    @player2 = PLAYER_TYPES[p2.to_i].new(1, board_evaluator)
    player1.difficulty = d1.to_i if d1
    player2.difficulty = d2.to_i if d2

    @current_player = player1
    # loop through until the game was won or tied
    until board_evaluator.game_is_over?
      display.draw_next_move board_evaluator.board
      move = current_player.get_move

      until board_evaluator.valid_move?(move) && valid_input?(move)
        move = current_player.get_move
      end

      board_evaluator.apply_move(move.to_i)
      @current_player = adversary
    end
    display.draw_board board_evaluator.board
    puts "Game over"
    puts board_evaluator.tie? ? "Draw" : "Winner was #{ adversary.to_s }"
  end

  private

  def adversary
    current_player == player1 ? player2 : player1
  end

  def valid_input?(input)
    unless input.match?(/[0-8]/)
      puts "Must be a value between 0 and 8"
      return false
    end
    true
  end

end

game = Game.new
p1 = "x"
d1 = nil
p2 = "o"
d2 = nil

until p1.match?(/[0-1]/)
  p1 = game.display.select_player 1
end
if p1 == "1"
  until d1 && d1.match?(/[0-1]/)
    d1 = game.display.select_difficulty
  end
end

until p2.match?(/[0-1]/)
  p2 = game.display.select_player 2
end

if p2 == "1"
  until d2 && d2.match?(/[0-1]/)
    d2 = game.display.select_difficulty
  end
end
game.start_game p1, d1, p2, d2
