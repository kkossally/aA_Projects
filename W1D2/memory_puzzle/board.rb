require_relative "card.rb"
require 'byebug'

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(4) { Array.new(4) }
    populate
  end

  def create_cards
    cards_array = []
    2.times do
      ("A".."I").each do |value|
        cards_array << Card.new(value.to_sym)
      end
    end
    cards_array
  end

  def populate
    cards_array = create_cards
    cards_array.shuffle!
    (0..3).each do |row|
      (0..3).each do |col|
        pos = [row, col]
        self[pos] = cards_array.shift
      end
    end
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, card)
    row, col = pos
    self.grid[row][col] = card
  end

  def render
    row0 = "0 "
    (0..3).each do |col|
      pos = [0, col]
      row0 << ( self[pos].face_up ? self[pos].to_s + " " : " " )
    end

    row1 = "1 "
    (0..3).each do |col|
      pos = [1, col]
      row1 << ( self[pos].face_up ? self[pos].to_s + " " : " " )
    end
    
    row2 = "2 "
    (0..3).each do |col|
      pos = [2, col]
      row2 << ( self[pos].face_up ? self[pos].to_s + " " : " " )
    end

    row3 = "3 "
    (0..3).each do |col|
      pos = [3, col]
      row3 << ( self[pos].face_up ? self[pos].to_s + " " : " " )
    end

    puts "  0 1 2 3"
    puts row0
    puts row1
    puts row2
    puts row3
  end

  def won?
    grid.flatten.all? { |card| card.face_up}

  end

end

# board = Board.new
# card = Card.new(:L)

# pos = [0, 0]
# pos_2 = [1, 1]

# board[pos] = card

# p board.empty?(pos)
# p board.empty?(pos_2)

# board.populate
# p board.grid

# row = 0
# (0..3).each do |col|
#   pos =[row, col]
#   board[pos].reveal
# end

# (0..3).each do |row|
#   (0..3).each do |col|
#     pos =[row, col]
#     board[pos].reveal
#   end
# end

# board.render

# p board.won?