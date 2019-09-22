require_relative 'piece'

class Pawn < Piece
  attr_reader :color, :pos

  def symbol
    :P 
  end

  def move_dirs
    side_attacks << forward_steps
  end

  private 

  def at_start_row? 
    return true if color == :white && pos[0] == 6
    return true if color == :black && pos[0] == 1
    false 
  end

  def forward_dir
    color == :white ? -1 : 1 
  end

  def forward_steps 
    [forward_dir, 0]
  end

  def side_attacks
    [ [forward_dir, forward_dir], [forward_dir, -forward_dir] ]
  end 



end