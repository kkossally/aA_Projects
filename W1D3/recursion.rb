require 'byebug'

# RANGE
def range_iter(first, final)
  return [] if final < first

  range = Array.new
  (first...final).each do |num|
    range << num
  end

  range
  
end

def range_recur(first, final)
  return [] if final < first
  return [first] if final - first == 1

  range_recur(first, final - 1) + [final - 1]
end

# EXPONENTIATION
def exp_one(base, exponent)
  return 1 if exponent == 0
  
  base * exp_one(base, exponent - 1)
end

# p exp_one(5, 0)
# p exp_one(5, 1)
# p exp_one(5, 4) # 625
# p exp_one(5, 5) # 3125

def exp_two(base, exponent)
  return 1 if exponent == 0
  return base if exponent == 1

  base_to_half_exponent = exp_two(base, exponent / 2)


  if exponent.even?
    result = base_to_half_exponent * base_to_half_exponent
  else
    result = base_to_half_exponent * base_to_half_exponent * base
  end

  result
end

# p exp_two(5, 0)
# p exp_two(5, 1)
# p exp_two(5, 4) # 625
# p exp_two(5, 5) # 3125
# p exp_two(6, 10)

# DEEP DUP
def deep_dup(array)
  result = Array.new
  array.each do |ele|
    if !ele.is_a?(Array)
      result << ele 
    else
      result << deep_dup(ele)
    end
  end
  result
end

# FIBONACCI
def fib_recur(n)
  return [] if n < 1
  return [0] if n == 1
  return [0, 1] if n == 2

  prev_fib = fib_recur(n-1)
  prev_fib + [prev_fib[-2..-1].sum]
end

def fib_iter(n)
  return [] if n < 1
  return [0] if n == 1
  return [0, 1] if n == 2

  result = [0, 1]
  until result.length == n
    result << result[-2..-1].sum
  end

  result
end

# BINARY SEARCH
def bsearch(arr, target)
  return nil if arr.length == 1 && arr.first != target
  
  mid_idx = arr.length / 2
  middle = arr[mid_idx]

  return mid_idx if middle == target

  if middle > target
    left = arr[0...mid_idx]
    bsearch(left, target)
  else
    right = arr[mid_idx + 1..-1]
    result = bsearch(right, target)
    unless result == nil  # if the result is nil, we want to pass that back up to previous recursive calls
      result += (mid_idx + 1) # we add one because right excludes the middle element of the parent array
    end
    result
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
# p bsearch([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 10) # => 9

# MERGE SORT
def merge_sort(array)
  return array if array.length <= 1

  mid_idx = array.length / 2
  merge(merge_sort(array[0...mid_idx]), merge_sort(array[mid_idx..-1]))
end

def merge(arr_one, arr_two)
  sorted = []
  until arr_one.empty? || arr_two.empty?
    if arr_one.first <= arr_two.first
      sorted << arr_one.shift
    else
      sorted << arr_two.shift
    end
  end
  sorted + arr_one + arr_two
end

p a = [38, 27, 43, 3, 9, 82, 10]
p merge_sort(a)
p b = (0..100).to_a.sample(9).shuffle
p merge_sort(b)
p c = (0..100).to_a.sample(9).shuffle
p merge_sort(c)
p d = (0..100).to_a.sample(9).shuffle
p merge_sort(d)

# def subsets(arr)
#   return [[]] if arr.empty?
#   # return [[], arr] if arr.length == 1
  
#   subsets(arr[0...-1]) << [arr[-1]]
# end