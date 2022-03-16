require 'byebug'
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = Array.new(0)
  end

  def play

  end

  def take_turn

  end

  def show_sequence

  end

  def require_sequence

  end

  def add_random_color
    debugger
  end

  def round_success_message

  end

  def game_over_message

  end

  def reset_game

  end
end
