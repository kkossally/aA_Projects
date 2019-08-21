require 'byebug'

class Towers
  attr_reader :discs
  attr_accessor :stacks

  def initialize(discs=5)
    @discs = discs
    @stacks = Array.new(3) {Array.new []}
    setup(discs)
  end

  def setup(discs)
    i = discs
    while i > 0
      self.stacks[0] << i
      i -= 1
    end
  end

  def play
    p stacks
    until won?
      move
      p stacks
    end
    puts "Congrats! You won!"
  end

  def get_move
    puts "Which stack would you like to take from?"
    a = gets.chomp.to_i
    puts "Where would you like to put the disc?"
    b = gets.chomp.to_i
    return [a, b] if valid_move?(a, b)
  end

  def valid_move?(a, b)
    return true if stacks[b].empty? || stacks[a].last < stacks[b].last
    false
  end

  def won?
    return false unless stacks.last.count == discs
    true
  end

  def move
    a, b = self.get_move
    self.stacks[b] << (self.stacks[a].pop)
  end
end

if $PROGRAM_NAME == __FILE__
  towers = Towers.new(5)
  towers.play
end