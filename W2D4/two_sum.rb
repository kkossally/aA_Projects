require 'byebug'

def bad_two_sum?(arr, target)
  indices = []

  arr.each_with_index do |el1, idx1|
    arr.each_with_index do |el2, idx2|
      if idx2 > idx1 && el2 + el1 == target
        return true
      end
    end
  end
  false
end

arr = [0, 1, 5, 7]
puts bad_two_sum?(arr, 6) # => should be true
puts bad_two_sum?(arr, 10) # => should be false

# Sort the array O(nlogn)
# Create a copy of all the elements of the array that are <= target O(n)
# Create a hash of addends of the target O(n)
# Bsearch in order for the first key O(logn)
# if key is found bsearch for the corresponding value O(logn)
# if key is found return true O(1)
# else search for the next key O(logn)

def okay_two_sum?(array, target)
  sorted = array.sort
  addends = []

  (0..target/2).each do |addend|
    addends << addend
  end
  # debugger

  addends.each do |addend|
    debugger
    if bsearch(sorted, addend)
      # debugger
      return true if bsearch(sorted, target-addend)
    end
  end
  false
end

def bsearch(array, target)
  # debugger
  pivot = array.length / 2

  case target <=> array[pivot]
  when -1
    bsearch(array.take(pivot-1),target)
  when 0
    return true
  when 1
    bsearch(array.drop(pivot+1),target)
  end

  # debugger
  false
end

puts okay_two_sum?(arr, 6) # => should be true
puts okay_two_sum?(arr, 10) # => should be false