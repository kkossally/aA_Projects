require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
  include Slideable
  attr_reader :pos, :board, :color 


  def symbol
    :R
  end

  protected

  def move_dirs
    horizontal_dirs 
  end

end