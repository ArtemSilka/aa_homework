class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      next if i == 6 || i == 13
      4.times do 
        cup << :stone
      end
    end
    
  end

  def valid_move?(start_pos)
    unless (0..5).include?(start_pos) || (7..13).include?(start_pos)
      raise 'Invalid starting cup'
    end
    if @cups[start_pos].empty?
      raise 'Starting cup is empty'
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    cup_pos = start_pos
    until stones.empty?
      cup_pos += 1
      cup_pos = 0 if cup_pos > 13
      if cup_pos == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif cup_pos == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[cup_pos] << stones.pop
      end
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? { |cup| cup.empty? } || @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    player1_count = @cups[6].count
    player2_count = @cups[13].count

    if player1_count == player2_count
      return :draw
    else
      player1_count > player2_count ? @name1 : @name2
    end
  end
end
