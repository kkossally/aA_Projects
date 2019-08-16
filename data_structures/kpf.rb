require 'byebug'
require_relative './lib/00_tree_node.rb'

class KnightPathFinder
  attr_reader :start_pos, :root_node
  attr_accessor :considered_pos

  def initialize(start_pos) # [0, 0]
    @start_pos = start_pos
    @root_node = PolyTreeNode.new(start_pos)
    build_move_tree
    @considered_pos = [start_pos]
  end

  def build_move_tree 
  end 

  def self.valid_moves(pos) # returns an array of possible positions [[0,0], [1,0]...]
    # x and y must be between 0 and 7 inclusive
    # pos[0] - 
    valid_moves = [[3,5], [2,4], [2,2], [3,1], [5, 1], [6, 2], [6,4], [5, 5]] # start pos is [4, 3]
    valid_moves
  end

  def valid_move?(new_pos) # return true if new_pos is valid
    x0, y0 = start_pos
    x1 , y1 = new_pos
    # return false if x or y is not between 0 and 7 inclusive
    return false if !x1.between?(0, 7) || !y1.between?(0, 7)
    (x1 - x0).abs + (y1 - y0).abs == 3
  end

  def new_move_positions(pos)  # returns an array of new moves not in considered postions and then adds them to consiered positions
    new_moves = KnightPathFinder.valid_moves(pos).reject {|move| considered_pos.include?(move) } # position will be current position 
    considered_pos.concat(new_moves)
    new_moves
  end 

end

if $PROGRAM_NAME == __FILE__
  kpf = KnightPathFinder.new([4, 3])
  
  # p kpf.new_move_positions([4, 3])
  # p kpf.considered_pos

  p kpf.valid_move?([3, 5])
  p kpf.valid_move?([6, 3])
end