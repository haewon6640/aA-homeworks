require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0...cups.length).each do |i|
      next if i == 6 || i == 13
      4.times do 
        cups[i] << :stone
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 14
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stone_count = cups[start_pos].length
    cups[start_pos] = Array.new()
    opponent_cuphole = current_player_name == @name1 ? 13 : 6
    i = start_pos+1
    last = start_pos+1+stone_count
    while i < last
      hole = i % 14
      if hole == opponent_cuphole
        last += 1
      else
        cups[hole] << :stone 
      end
      i+=1
    end
    render
    return next_turn((last-1) % 14)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13 
      return :prompt
    elsif cups[ending_cup_idx].length == 1 
      return :switch
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
    left_empty = cups[0..5].all? {|cup| cup.empty?}
    right_empty = cups[7..12].all? {|cup| cup.empty?}
    left_empty || right_empty
  end

  def winner
    current = cups[6].length
    oppose = cups[13].length
    return :draw if current == oppose
    if current > oppose
      return @name1
    else
      return @name2
    end
  end
end
