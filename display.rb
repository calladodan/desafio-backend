require 'pry'

class Display

  def initialize
    initial_screen
  end

  def initial_screen
    puts "Welcome to the fabulous Tic-Tac-Toe"
    puts "Player types"
    puts "0 - Human"
    puts "1 - Bot"

  end

  def select_player number
    puts "Select the type for player #{number}"
    gets.chomp
  end

  def draw_next_move board
    system('clear')
    draw_board board
    draw_input
  end

  def draw_board board
    puts " #{board[0]} | #{board[1]} | #{board[2]} \n===+===+===\n #{board[3]} | #{board[4]} | #{board[5]} " +
             "\n===+===+===\n #{board[6]} | #{board[7]} | #{board[8]} \n"
  end

  def draw_input
    puts "Type in the position you want to play [0 : 8]: "
  end

  def select_difficulty
    puts "Select the difficulty:"
    puts "0 - Easy"
    puts "1 - Hard"
    gets.chomp
  end

end