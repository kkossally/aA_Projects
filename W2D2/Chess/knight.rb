require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
  include Stepable
  attr_reader :pos, :board, :color 

  def symbol
    :N 
  end
  
  protected

  def move_diffs
    [ [-2, -1], [-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [-1, -2], [1, -2] ]
  end

end