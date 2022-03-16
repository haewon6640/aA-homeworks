require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new()}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0...14).each do |i|
      next if i == 6 || i == 13
      4.times do 
        cups[i] << :stone
      end
    end

  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos >= 14
    raise 'Starting cup is empty' if cups[start_pos].length == 0
  end

  def make_move(start_pos, current_player_name)
    # debugger
    opposing_hole = current_player_name == @name1 ? 13 : 6
    i = start_pos+1
    while cups[start_pos].length != 0
      next if i == opposing_hole
      cups[i] << cups[start_pos].shift
      i+=1
    end
    return next_turn(i-1)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if cups[ending_cup_idx].length == 1
      return :switch
    elsif ending_cup_idx == 13 || ending_cup_idx == 6
      return :prompt
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
