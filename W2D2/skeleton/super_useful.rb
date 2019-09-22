# PHASE 2
def convert_to_int(str)
  begin 
    Integer(str) 
  rescue TypeError 
    return nil 
  end 
end

# PHASE 3
class WrongFoodError < StandardError; end
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == 'coffee'
    raise WrongFoodError
  else 
    raise StandardError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue WrongFoodError
    puts ":("
    retry if maybe_fruit == 'coffee'
  end
end  

# PHASE 4
class StrangerError < StandardError; end 
class NoNameError < StandardError; end 
class NoHobbyError < StandardError; end 


class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise NoNameError.new('Your best friend has no name!') unless name.length > 0
     @name = name
    
  
    raise  StrangerError.new('You need to have known each other for at least 5 years') unless yrs_known >= 5 
      @yrs_known = yrs_known

    raise NoHobbyError.new('You have no pastimes!') unless fav_pastime.length > 0 
      @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


