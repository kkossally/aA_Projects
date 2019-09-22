module Slideable
  def horizontal_dirs 
    HORIZONTAL_DIRS
  end
  
  def diagonal_dirs 
    Slideable.DIAGONAL_DIRS
  end

  private
  attr_reader :HORIZONTAL_DIRS, :DIAGONAL_DIRS

  horizontal = []
  (-7..7).each {|delta| horizontal << [0, delta] unless delta == 0}

  vertical = []
  (-7..7).each {|delta| vertical << [delta, 0] unless delta == 0}

  HORIZONTAL_DIRS = horizontal + vertical
  
  down_right = []
  (1..7).each { |delta| down_right << [delta, delta]}
  
  up_left = []
  (1..7).each { |delta| up_left << [-delta, -delta]}
  
  down_left = []
  (1..7).each { |delta| down_left << [delta, -delta]}
  
  up_right = []
  (1..7).each { |delta| up_right << [-delta, delta]}

  DIAGONAL_DIRS = down_right + down_left + up_right + up_left



end

# current class constants hold too much info, they should just be the moves
# one square away

# gorw unblocked moves will return an array of all the possible moves
# to the edge of the board in one dir

# move_dirs is an almost empty module method that will be overwritten by the
# piece's actual move pattern, but its job is to tell us what direction we can
# move in before grow builds the arrays

# move will put all that together to return all the valid moves