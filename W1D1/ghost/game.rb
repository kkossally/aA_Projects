require 'set'


class Game

  attr_reader :dictionary
  attr_accessor :player_one, :player_two, :fragment, :current_player

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @fragment = ""
    @dictionary = Set.new( File.readlines("dictionary.txt").map(&:chomp) )
    @current_player = @player_one
  end

  def next_player
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end 
  end

  def take_turn(player)
    puts "Enter a character!"
    input = nil
    until input
      input = gets.chomp.downcase 
      until valid_play?(input)
        puts "Invalid character!"
        input = nil
      end
    end
    @fragment += input
  end

  def valid_word?
    dictionary.any? { |word| word.start_with?(fragment) }
    
    
  end

  def valid_play?(str)
    if str.length != 1 || !('a'..'z').to_a.include?(str)
      puts "Invalid character! Try again."
      return false
    end
    true
  end
   
  def game_over?
    @dictionary.subset?([fragment].to_set)
  end

  def play_round
    take_turn(current_player)
    next_player
    puts fragment
    valid_word?
  end

end

game = Game.new("p1", "p2")
until game.game_over?
  game.play_round
end