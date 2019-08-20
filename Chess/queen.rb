require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable
  attr_reader :pos, :board, :color 

  def symbol
    :Q 
  end 
end