module Slideable
  def

  end

  private

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