def first_anagram?(str1, str2)
  str1.split("").permutation.to_a.include?(str2.split("")) # O(n!)
end

puts first_anagram?("gizmo", "sally")    #=> false
puts first_anagram?("elvis", "lives")    #=> true



def second_anagram?(str1, str2)
  str1_chars = str1.split("") # O(n)
  str2_chars = str2.split("") # O(n)

  str1_chars.each do |ele| # O(n) => O(n^2)
    if str2_chars.include?(ele) # O(n)
      idx = str2_chars.find_index(ele) #O(n) but not for every element, so doesn't get multiplied
      str2_chars.delete_at(idx) # O(1)
    else
      return false # O(1)
    end
  end
  str2_chars.empty? # O(1)
end

puts second_anagram?("gizmo", "sally")    #=> false
puts second_anagram?("elvis", "lives")    #=> true



def third_anagram?(str1, str2)
  str1.split("").sort == str2.split("").sort # O(n log(n))
end

puts third_anagram?("gizmo", "sally")    #=> false
puts third_anagram?("elvis", "lives")    #=> true


def fourth_anagram?(str1, str2)
  counter1 = Hash.new(0) # O(1)
  counter2 = Hash.new(0) # O(1)

  str1.each_char do |char| # O(n)
    counter1[char] += 1 # O(1)
  end

  str2.each_char do |char| # O(n)
    counter2[char] += 1 # O(1)
  end

  counter1 == counter2 # O(n)
end

puts fourth_anagram?("gizmo", "sally")    #=> false
puts fourth_anagram?("elvis", "lives")    #=> true

def fourth_anagram_bonus?(str1, str2)
  counter1 = Hash.new(0) # O(1)

  str1.each_char do |char| # O(n)
    counter1[char] += 1 # O(1)
  end

  str2.each_char do |char| # O(n)
    counter1[char] -= 1 # O(1)
  end

  counter1.values.all? { |val| val == 0 } # O(n)
end

puts fourth_anagram_bonus?("gizmo", "sally")    #=> false
puts fourth_anagram_bonus?("elvis", "lives")    #=> true