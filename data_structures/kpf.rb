require 'byebug'
require_relative './lib/00_tree_node.rb'

class KnightPathFinder
  attr_reader :start_pos, :root_node
  attr_accessor :considered_pos

  def initialize(start_pos) # [0, 0]
    @start_pos = start_pos
    @root_node = PolyTreeNode.new(start_pos)
    @considered_pos = [start_pos]
    build_move_tree
  end

  def build_move_tree
    tree = []
    possible_moves = self.new_move_positions(root_node.value)
    possible_moves.each do |move|
      new_node = PolyTreeNode.new(move)
      new_node.parent = root_node
      tree << new_node
    end
    
    # repeat this process until new_move_positions returns an empty array
    tree
  end 

  def self.valid_moves(from_pos) # returns an array of possible positions [[0,0], [1,0]...]
    # valid_moves = [[3,5], [2,4], [2,2], [3,1], [5, 1], [6, 2], [6,4], [5, 5]] # start pos is [4, 3]
    moves = []
    7.times do |x| 
      7.times do |y| 
        to_pos = [x, y]
        moves << to_pos if valid_move?(from_pos, to_pos)
      end 
    end 
    moves 
  end

  def self.valid_move?(from_pos, to_pos) # return true if new_pos is valid
    x0, y0 = from_pos
    x1 , y1 = to_pos
    return false unless (x1 - x0).abs <= 2 && (y1 - y0).abs <= 2
    (x1 - x0).abs + (y1 - y0).abs == 3
  end

  def new_move_positions(from_pos)  # returns an array of new moves not in considered postions and then adds them to considered positions
    new_moves = KnightPathFinder.valid_moves(from_pos).reject {|move| considered_pos.include?(move) } # position will be current position 
    considered_pos.concat(new_moves)
    new_moves
  end 

end

if $PROGRAM_NAME == __FILE__
  p kpf = KnightPathFinder.new([4, 3])

  # p KnightPathFinder.valid_moves([4,3])
  
  # kpf.considered_pos += [[3,5], [2,4], [2,2]]
  # p "considered positions #{kpf.considered_pos}"

  # p kpf.new_move_positions([4, 3])
  # p KnightPathFinder.valid_moves
  

  # p kpf.valid_move?([3, 5])
  # p kpf.valid_move?([6, 3])
end