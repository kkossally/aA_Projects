module Slideable
  def horizontal_dirs 
    HORIZONTAL_DIRS
  end
  
  def diagonal_dirs 
    Slideable.DIAGONAL_DIRS
  end

  def moves
    # move will put all that together to return all the valid moves
  end

  private
  attr_reader :HORIZONTAL_DIRS, :DIAGONAL_DIRS

  HORIZONTAL_DIRS = [ [-1, 0], [1, 0], [0, -1] [0, 1] ]

  DIAGONAL_DIRS = [ [-1, -1], [-1, 1], [1, -1], [1, 1] ]


  def move_dirs
    HORIZONTAL_DIRS + DIAGONAL_DIRS
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    move_list = [[dx, dy]]
    until move_list.count == 7
      move_list << [ (move_list.last[0] + dx), (move_list.last[1] + dy)]
    end
    move_list
  end
  # horizontal = []
  # (-7..7).each {|delta| horizontal << [0, delta] unless delta == 0}

  # vertical = []
  # (-7..7).each {|delta| vertical << [delta, 0] unless delta == 0}

  # down_right = []
  # (1..7).each { |delta| down_right << [delta, delta]}
  
  # up_left = []
  # (1..7).each { |delta| up_left << [-delta, -delta]}
  
  # down_left = []
  # (1..7).each { |delta| down_left << [delta, -delta]}
  
  # up_right = []
  # (1..7).each { |delta| up_right << [-delta, delta]}
end