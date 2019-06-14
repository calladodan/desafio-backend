require_relative 'base_player'
class Bot < BasePlayer

  attr_accessor :difficulty

  def initialize(player_number, board_evaluator)
    super
    @difficulty = nil
  end

  def get_move
    sleep 2
    eval_board.to_s
  end

  def eval_board
    spot = nil
    until spot
      if board_evaluator.possible_moves.include?("4")
        return 4
      else
        spot = get_best_move(board_evaluator, marker)
        if board_evaluator.board[spot] != "X" && board_evaluator.board[spot] != "O"
          return spot
        else
          spot = nil
        end
      end
    end
  end

  def get_best_move(board_evaluator, next_player, depth = 0, best_score = {})
    best_move = nil
    # In case the difficulty is set to hard, it will enter the heuristic
    if difficulty == 1
      board_evaluator.possible_moves.each do |as|
        board_evaluator.board[as.to_i] = marker
        if board_evaluator.game_is_over?
          best_move = as.to_i
          board_evaluator.board[as.to_i] = as
          return best_move
        else
          board_evaluator.board[as.to_i] = MARKERS[number - 1]
          if board_evaluator.game_is_over?
            best_move = as.to_i
            board_evaluator.board[as.to_i] = as
            return best_move
          else
            board_evaluator.board[as.to_i] = as
          end
        end
      end
    end

    #if not it will just try a random move
    if best_move
      best_move
    else
      board_evaluator.possible_moves.sample.to_i
    end
  end


end