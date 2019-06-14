class BasePlayer
  MARKERS = %w[X O]

  attr_reader :marker, :number, :board_evaluator

  def initialize(player_number, board_evaluator)
    @number = player_number
    @marker = MARKERS[player_number]
    @board_evaluator = board_evaluator
  end

  def get_move; end

  def to_s
    "Player #{number + 1} #{ self.class.name }"
  end

end