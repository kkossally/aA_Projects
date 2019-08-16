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
    valid_moves = [[0,1], [1,0], [0,3], [1,3], [4,1], [4,3], [3,4], [1,4]]
    valid_moves
  end 

  def new_move_positions(pos)  
    # calls ::valid_moves to get array of possible moves  
    new_moves = KnightPathFinder.valid_moves(pos).reject {|move| considered_pos.include?(move) } # position will be current position 
    # filters out any positions that exists in considered_pos 
    # returns remaining positions 
    considered_pos.concat(new_moves)
  end 

end

if $PROGRAM_NAME == __FILE__
  kpf = KnightPathFinder.new([2,2])
  
  p kpf.new_move_positions([2,2])
  p kpf.considered_pos


end