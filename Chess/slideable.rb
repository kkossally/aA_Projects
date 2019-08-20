require 'byebug'

module Slideable
  
  def horizontal_dirs 
    HORIZONTAL_DIRS
  end
  
  def diagonal_dirs 
    DIAGONAL_DIRS
  end

  def moves
    all_moves = []
    move_dirs.each do |dir|
      all_moves += grow_unblocked_moves_in_dir(dir[0], dir[1])
    end
    all_moves
  end

  private

  HORIZONTAL_DIRS = [ [-1, 0], [1, 0], [0, -1], [0, 1] ]
  DIAGONAL_DIRS = [ [-1, -1], [-1, 1], [1, -1], [1, 1] ]

  def move_dirs
    horizontal_dirs + diagonal_dirs # should raise error so we catch when we forget to rewrite in piece subclasses
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    move_list = []
    
    next_step = [pos[0] + dx, pos[1] + dy]

    blocked = false 
    
    # debugger
    until blocked 
      if !next_step[0].between?(0,7) || !next_step[1].between?(0,7)
        # debugger 
        blocked = true
      elsif !board[next_step].empty?
        # debugger
        blocked = true
        move_list << next_step if board[next_step].color != self.color
      else
        # debugger
        move_list << next_step
        next_step = [next_step[0] + dx, next_step[1] + dy]
      end
    end

    # debugger
    move_list
  end

end