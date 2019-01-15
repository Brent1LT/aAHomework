class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_index do |i|
      next if i == 6 || i == 13
      cups[i] = [:stone, :stone, :stone, :stone]
    end
  end


  def valid_move?(start_pos)
    if start_pos > 13
      raise "Invalid starting cup"
    end
    if cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    distribute_stones = []
    until cups[start_pos].empty?
      distribute_stones << cups[start_pos].pop
    end

    i = start_pos
    until distribute_stones.empty?
      i += 1
      i = 0 if i == 14
      if i == 13 && current_player_name == @name1
        i = 0
        next
      elsif i == 6 && current_player_name == @name2
        next
      end
      cups[i] << distribute_stones.pop
    end

    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif cups[ending_cup_idx].length == 1
      return :switch
    elsif !cups[ending_cup_idx].empty?
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
    return true if cups[0..5].all? {|arr| arr.empty?} || cups[7..12].all? {|arr| arr.empty?}
    false
  end

  def winner
    case cups[6].length <=> cups[13].length
    when -1
      @name2
    when 0
      :draw
    else
      @name1
    end 
  end
end
