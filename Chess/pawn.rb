require_relative 'piece'

class Pawn < Piece

  def symbol
    :P 
  end

  def move_dirs
    HORIZONTAL_DIRS = [ [-1, 0], [1, 0], [0, -1], [0, 1] ]
    DIAGONAL_DIRS = [ [-1, -1], [-1, 1], [1, -1], [1, 1] ]
  end

  private 

  def at_start_row? 
  end

  def forward_dir
  end

  def forward_steps 
  end

  def side_attacks
  end 



end