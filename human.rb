require_relative 'base_player'
require 'pry'

class Human < BasePlayer

  def get_move
    gets.chomp
  end

end