require 'byebug'
require_relative 'piece.rb'

class Board 
  attr_accessor :rows 

  def initialize
    @rows = Array.new(8) { Array.new(8) }
    set_up_board
  end

  def set_up_board
    (0..7).each do |row|
      (0..7).each do |col|
        if row < 2 || row > 5
            pos = [row, col]
          self[pos] = Piece.new 
        end
      end
    end
  end

  def [](pos)
    row, col = pos
    rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    rows[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].nil? 
      raise ArgumentError.new('start position empty')
    elsif !self[end_pos].nil? 
      raise ArgumentError.new('end position not empty')
    end
    temp_piece = self[start_pos]
    self[start_pos] = nil
    self[end_pos] = temp_piece 
  end

end


if $PROGRAM_NAME == __FILE__ 
  board = Board.new 
  board.move_piece([0,0], [2,0])
  puts board.rows 
end 

