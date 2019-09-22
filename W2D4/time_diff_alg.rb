require "byebug"

def my_min1(array)
  array.each do |el1|
    return el1 if array.none? { |el2| el2 < el1 }
  end
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

puts "my_min Phase I: #{my_min1(list)}"

def my_min2(array)
  min = array.first

  array.each do |el|
    min = el if el < min
  end
  
  min
end

puts
puts "my_min Phase II: #{my_min2(list)}"

def lcs(array)
  subs = []

  array.each_index do |idx1|
    (idx1...array.length).each do |idx2|
      sub = array[idx1..idx2]
      subs << sub
    end
  end

  subs.map(&:sum).max
end

list1 = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]

puts
puts "larges contiguous sub-sum Phase I example a: #{lcs(list1)}"
puts
puts "larges contiguous sub-sum Phase I example b: #{lcs(list2)}"
puts
puts "larges contiguous sub-sum Phase I example c: #{lcs(list3)}"

def lcs2(array)
  max = array.first
  curr_sum = 0

  array.each do |el|
    curr_sum += el
    if curr_sum > max
      max = curr_sum
    elsif curr_sum < 0
      curr_sum = 0
    end
  end
  max
end

puts
puts "largest continuous sub-sum Phase II example a: #{lcs2(list1)}"
puts
puts "largest continuous sub-sum Phase II example b: #{lcs2(list2)}"
puts
puts "largest continuous sub-sum Phase II example c: #{lcs2(list3)}"