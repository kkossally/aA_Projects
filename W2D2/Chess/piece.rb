class Piece 

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    symbol.to_s
  end

  def empty?
    # check self to see if self is NullPiece
    self.is_a?(NullPiece)
  end

  def valid_moves
    # for now, it will just be moves 
    #eventually will check for check 

  end

  def pos=(val)
    @pos = val
  end

  def symbol
  end

  private

  def move_into_check?(end_pos)

  end

  # def inspect
  #   symbol.inspect
  # end

end