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
          self[pos] = 'piece'
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
    
  end

end


if $PROGRAM_NAME == __FILE__ 
  board = Board.new 
  p board.rows  
end 